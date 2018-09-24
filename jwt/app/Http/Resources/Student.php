<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Student extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    protected $timestamp = false;
   
        public function toArray($request)
    {
        //return parent::toArray($request);

        //following is cutomize resource.

        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email, 
            'course_id' => $this->course_id,
        ];
    }
    
}
