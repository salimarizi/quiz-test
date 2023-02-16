<?php

namespace App\Http\Controllers;

use App\Models\Quiz;
use Illuminate\Support\Facades\Validator;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helper\ResponseHelper;
use Illuminate\Support\Facades\DB;

class QuizController extends Controller
{
    protected $validation = [
        'name' => 'required|string',
        'description' => 'nullable|string',
        'isPublished' => 'required|boolean',
    ];

    protected $questionValidation = [
        'quizId' => 'nullable|integer',
        'content' => 'required|string',
        'isMandatory' => 'required|boolean',
        'order' => 'required|integer',
    ];

    protected $answerValidation = [
        'questionId' => 'nullable|integer',
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
            return ResponseHelper::success(Quiz::all());
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
                DB::beginTransaction();
                $quiz = Quiz::create($request->all());

                $this->proceedQuestion($quiz, $request);

                DB::commit();
                return ResponseHelper::success($quiz);
            }
        } catch (Exception $e) {
            DB::rollBack();
            return ResponseHelper::failed($e, 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id): Response
    {
        try {
            $quiz = Quiz::find($id);
            if (!$quiz) {
                return ResponseHelper::failed("Data Not found", 404);
            } else {
                $this->getQuestionsAndAnswers($quiz);
                return ResponseHelper::success($quiz);
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
            $quiz = Quiz::find($id);
            if (!$quiz) {
                return ResponseHelper::failed("Data Not found", 404);
            }

            $validator = Validator::make($request->all(), $this->validation);

            if ($validator->fails()) {
                return ResponseHelper::failed($validator->errors()->all(), 400);
            } else {
                DB::beginTransaction();
                $quiz = Quiz::find($id)->update($request->all());

                $this->proceedQuestion($quiz, $request);

                DB::commit();
                return ResponseHelper::success(Quiz::find($id));
            }
        } catch (Exception $e) {
            DB::rollBack();
            return ResponseHelper::failed($e, 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): Response
    {
        try {
            $quiz = Quiz::find($id);
            if (!$quiz) {
                return ResponseHelper::failed("Data Not found", 404);
            }
            DB::beginTransaction();

            Quiz::find($id)->delete();

            DB::commit();
            return ResponseHelper::success("Successfully delete data");
        } catch (Exception $e) {
            DB::rollBack();
            return ResponseHelper::failed($e, 500);
        }
    }

    public function questions(string $id): Response
    {
        try {
            $quiz = Quiz::find($id);
            if (!$quiz) {
                return ResponseHelper::failed("Data Not found", 404);
            }

            return ResponseHelper::success($quiz->questions);
        } catch (Exception $e) {
            return ResponseHelper::failed($e, 500);
        }
    }

    public function proceedQuestion($quiz, $request)
    {
        if ($request->has('questions')) {
            $quiz->questions()->delete();

            foreach ($request->questions as $question) {
                $questionValidator = Validator::make($question, $this->questionValidation);

                if ($questionValidator->fails()) {
                    DB::rollBack();
                    return ResponseHelper::failed($questionValidator->errors()->all(), 400);
                }

                $createdQuestion = $quiz->questions()->create($question);

                foreach ($question['answers'] as $answer) {
                    $answerValidator = Validator::make($answer, $this->answerValidation);

                    if ($answerValidator->fails()) {
                        DB::rollBack();
                        return ResponseHelper::failed($answerValidator->errors()->all(), 400);
                    }

                    $createdQuestion->answers()->create($answer);
                }
            }
        }

        $this->getQuestionsAndAnswers($quiz);
    }

    public function getQuestionsAndAnswers($quiz) {
        $quiz->questions = $quiz->questions;

        foreach ($quiz->questions as $question) {
            $question->answers = $question->answers;
        }
    }
}
