import { Injectable } from '@angular/core';
import { Http, RequestOptions, RequestMethod, Headers } from '@angular/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(private http:Http) { }

  login(input): Observable<any>{
    var body=JSON.stringify(input);
    var headerOptions=new Headers( {'Content-Type' : 'application/json'});
    var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
    return this.http.post('http://127.0.0.1:8000/api/login', body, requestOptions);
  }

  me(token: any): Observable<any>{
    console.log(token);
    var headerOptions=new Headers( {'Accept' : 'application/json',
      'Content-Type' : 'application/x-www-form-urlencoded',
    });
    var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
    return this.http.post( 'http://127.0.0.1:8000/api/me?token=' + token ,  requestOptions);
  }


}
