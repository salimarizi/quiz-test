<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Answer extends Model
{
    use HasFactory, SoftDeletes;


    protected $table = 'answers';

    protected $fillable = [
        'questionId',
        'content',
        'order',
        'isCorrectAnswer',
    ];

    const CREATED_AT = 'createdAt';
    const UPDATED_AT = 'updatedAt';
    const DELETED_AT = 'deletedAt';

    public function question()
    {
        return $this->belongsTo(Question::class, 'questionId');
    }
}
