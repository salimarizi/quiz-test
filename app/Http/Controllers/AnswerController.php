<?php

namespace App\Http\Controllers;

use App\Models\Answer;
use Illuminate\Support\Facades\Validator;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helper\ResponseHelper;

class AnswerController extends Controller
{
    protected $validation = [
        'questionId' => 'required|integer',
        'content' => 'required|string',
        'order' => 'required|integer',
        'isCorrectAnswer' => 'nullable|boolean',
    ];

    /**
     * Display a listing of the resource.
     */
    public function index(): Response
    {
        try {
            return ResponseHelper::success(Answer::all());
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
            $validator = Validator::make($request->all(), $this->validation);

            if ($validator->fails()) {
                return ResponseHelper::failed($validator->errors()->all(), 400);
            } else {
                $answer = Answer::create($request->all());

                return ResponseHelper::success($answer);
            }
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
            $answer = Answer::find($id);
            if (!$answer) {
                return ResponseHelper::failed("Data Not found", 404);
            } else {
                return ResponseHelper::success($answer);
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
            $answer = Answer::find($id);
            if (!$answer) {
                return ResponseHelper::failed("Data Not found", 404);
            }

            $validator = Validator::make($request->all(), $this->validation);

            if ($validator->fails()) {
                return ResponseHelper::failed($validator->errors()->all(), 400);
            } else {
                $answer = Answer::find($id)->update($request->all());
                return ResponseHelper::success(Answer::find($id));
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
            $answer = Answer::find($id);
            if (!$answer) {
                return ResponseHelper::failed("Data Not found", 404);
            }

            Answer::find($id)->delete();

            return ResponseHelper::success("Successfully delete data");
        } catch (Exception $e) {
            return ResponseHelper::failed($e, 500);
        }
    }
}
