<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class coursemaster extends Model
{
    protected $fillable = [
        'name', 'fee'
    ];

    public function student()
    {
        return $this->belongsTo('App\Student');
    }
}
