<?php

namespace App\Http\Controllers;

use App\Models\Question;
use Illuminate\Support\Facades\Validator;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helper\ResponseHelper;

class QuestionController extends Controller
{
    protected $validation = [
        'quizId' => 'required|integer',
        'content' => 'required|string',
        'isMandatory' => 'required|boolean',
        'order' => 'required|integer',
    ];

    /**
     * Display a listing of the resource.
     */
    public function index(): Response
    {
        try {
            return ResponseHelper::success(Question::all());
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
                $question = Question::create($request->all());

                return ResponseHelper::success($question);
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
            $question = Question::find($id);
            if (!$question) {
                return ResponseHelper::failed("Data Not found", 404);
            } else {
                return ResponseHelper::success($question);
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
            $question = Question::find($id);
            if (!$question) {
                return ResponseHelper::failed("Data Not found", 404);
            }

            $validator = Validator::make($request->all(), $this->validation);

            if ($validator->fails()) {
                return ResponseHelper::failed($validator->errors()->all(), 400);
            } else {
                $question = Question::find($id)->update($request->all());
                return ResponseHelper::success(Question::find($id));
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
            $question = Question::find($id);
            if (!$question) {
                return ResponseHelper::failed("Data Not found", 404);
            }

            Question::find($id)->delete();

            return ResponseHelper::success("Successfully delete data");
        } catch (Exception $e) {
            return ResponseHelper::failed($e, 500);
        }
    }
}
