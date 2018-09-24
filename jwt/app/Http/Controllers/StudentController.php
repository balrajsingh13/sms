<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\Student as StudentResource;
use App\Student;
use App\User;
use Illuminate\Support\Facades\Hash;
use Auth\AuthController;

class StudentController extends Controller
{
    private $name;
    private $email;
    private $course;
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['viewdetails']]);
    }


     /* READ */
    public function viewDetails(){

        $data = Student::paginate(15);       //get user data from masters table
        return StudentResource::collection($data);     //return collection of user data as a resource.
    }


    /*
    *
    *
    public function viewDetailsByName($name){
        $data = Master::firstOrNew([        //get user data from masters table of specific user name
            'name' => $name
        ]);     
        return new HomeResource($data);     //return collection of user data as a resource.
    }

    public function viewDetailsByEmail($email){
        $data = Master::firstOrNew([        //get user data from masters table of specific user name
            'email' => $email
        ]);     
        return new HomeResource($data);     //return collection of user data as a resource.
    }
    *
    *
    */

    /* CREATE */
    public function postDetail(Request $request){       //to regiser a student.
            $password = Hash::make($request->password);  
            $data = Student::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => $password,
                'course_id' => $request->course_id
            ])->save();
            $data = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => $password,
                'role_id' => $request->role_id
            ])->save();
            return response()->json($data, 201);
        //201 for created.
    }

    /*UPDATE*/
    public function putDetail(Request $request, $id){       //to update a students details
        $row = Student::findOrFail($request->id);        //get user data from masters table of specific id
        if($row){
        $row->name = $request->input('name'); 
        $row->email = $request->input('email');
        $row->password = $request->input('password'); 
        $row->role = $request->input('role'); 
        }
        $row->save();       //create record
        return new StudentResource($row);
        //200 for OK.
    }

    /*DELETE*/
    public function deleteDetail($id){      //to delete a student record
        $data = Student::where('id', $id);
        if($data->delete()){
            return new StudentResource($row);
        }
        //204 is for no content.
    }
}
