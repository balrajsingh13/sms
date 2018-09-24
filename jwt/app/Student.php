<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class student extends Model
{
    protected $fillable = [
        'name', 'email', 'password', 'course_id'
    ];

    public function courseMaster()
    {
        return $this->hasOne('App\CourseMaster', 'id');
    }
}
