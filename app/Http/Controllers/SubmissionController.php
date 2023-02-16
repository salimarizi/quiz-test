<?php

namespace App\Http\Controllers;

use App\Models\Submission;
use Illuminate\Support\Facades\Validator;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helper\ResponseHelper;
use Illuminate\Support\Facades\DB;

class SubmissionController extends Controller
{
    protected $validation = [
        'userId' => 'required|integer',
        'questionId' => 'required|integer',
        'answerId' => 'required|integer',
    ];

    /**
     * Display a listing of the resource.
     */
    public function index(): Response
    {
        try {
            return ResponseHelper::success(Submission::all());
        } catch (Exception $e) {
            return ResponseHelper::failed($e, 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): Response
    {
        try {
            DB::beginTransaction();

            $submissions = [];
            foreach ($request->answers as $answer) {
                $answer['userId'] = 1; //Hardcode because currently there is no auth feature
                $validator = Validator::make($answer, $this->validation);
    
                if ($validator->fails()) {
                    return ResponseHelper::failed($validator->errors()->all(), 400);
                } else {
                    $findData = Submission::where('userId', $answer['userId'])
                                            ->where('questionId', $answer['questionId'])
                                            ->first();
                    if ($findData) {
                        $findData->update($answer);

                        $submission = Submission::where('userId', $answer['userId'])
                                            ->where('questionId', $answer['questionId'])
                                            ->first();
                    } else {
                        $submission = Submission::create($answer);
                    }
    
                    array_push($submissions, $submission);
                }

            }
            
            DB::commit();
            return ResponseHelper::success($submissions);
        } catch (Exception $e) {
            return ResponseHelper::failed($e, 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id): Response
    {
        try {
            $submission = Submission::find($id);
            if (!$submission) {
                return ResponseHelper::failed("Data Not found", 404);
            } else {
                return ResponseHelper::success($submission);
            }
        } catch (Exception $e) {
            return ResponseHelper::failed($e, 500);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id): Response
    {
        try {
            $submission = Submission::find($id);
            if (!$submission) {
                return ResponseHelper::failed("Data Not found", 404);
            }

            $validator = Validator::make($request->all(), $this->validation);

            if ($validator->fails()) {
                return ResponseHelper::failed($validator->errors()->all(), 400);
            } else {
                $submission = Submission::find($id)->update($request->all());
                return ResponseHelper::success(Submission::find($id));
            }
        } catch (Exception $e) {
            return ResponseHelper::failed($e, 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): Response
    {
        try {
            $submission = Submission::find($id);
            if (!$submission) {
                return ResponseHelper::failed("Data Not found", 404);
            }

            Submission::find($id)->delete();

            return ResponseHelper::success("Successfully delete data");
        } catch (Exception $e) {
            return ResponseHelper::failed($e, 500);
        }
    }
}
