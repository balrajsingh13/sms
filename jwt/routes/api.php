<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::group([

    // 'prefix' => 'auth'

], function () {

    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

});

Route::get('student-details', 'StudentController@viewDetails')->name('viewdetails');

// Route::get('user-detail-by-name/{name}', 'HomeController@viewDetailsByName');

// Route::get('user-detail-by-email/{email}', 'HomeController@viewDetailsByEmail');

Route::post('student-post-detail', 'StudentController@postDetail');        //for creating new row.

Route::put('student-put-detail/{id}', 'StudentController@putDetail');      //for update whole row.

Route::delete('student-delete-detail/{id}', 'StudentController@deleteDetail');

Route::get('payload', 'StudentController@payload');