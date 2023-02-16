<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Question extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'questions';

    protected $fillable = [
        'quizId',
        'content',
        'isMandatory',
        'order',
    ];

    const CREATED_AT = 'createdAt';
    const UPDATED_AT = 'updatedAt';
    const DELETED_AT = 'deletedAt';

    public function quiz() {
        return $this->belongsTo(Quiz::class, 'quizId');
    }

    public function answers() {
        return $this->hasMany(Answer::class, 'questionId');
    }

    public function submission() {
        return $this->hasMany(Submission::class, 'submissionId');
    }
}
