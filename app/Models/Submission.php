<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Submission extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'submissions';

    protected $fillable = [
        'userId',
        'questionId',
        'answerId',
    ];

    const CREATED_AT = 'createdAt';
    const UPDATED_AT = 'updatedAt';
    const DELETED_AT = 'deletedAt';

    public function question() {
        return $this->belongsTo(Question::class, 'questionId');
    }

    public function answer() {
        return $this->belongsTo(Answer::class, 'answerId');
    }
}
