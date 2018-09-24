import { Injectable } from '@angular/core';
import { LoginService } from './login.service';
import { Http, RequestOptions, RequestMethod, Headers } from '@angular/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class StudentService {
  //private token: any;
  constructor(private http:Http) { }

  storeToken(token){
    localStorage.setItem('token', token);
  }

  getDetails(): Observable<any>{
    var headerOptions=new Headers( {'Accept' : 'application/json',
    'Content-Type' : 'application/x-www-form-urlencoded',
    });
    var requestOptions = new RequestOptions({ method: RequestMethod.Get, headers: headerOptions });
    return this.http.get('http://127.0.0.1:8000/api/student-details?token=' + localStorage.getItem('token') ,requestOptions);
  }

  setData(input)
  { var body=JSON.stringify(input);
    var headerOptions=new Headers( {'Content-Type' : 'application/json'});
    var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
    return this.http.post('http://127.0.0.1:8000/api/user-post-detail?token=' + localStorage.getItem('token'),body, requestOptions);
  }

}
