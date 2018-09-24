import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { StudentService } from '../student.service';
import { LoginService } from '../login.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  private type = "password";
  private obj: any;
  role: number = null;
  access_token: any;

  constructor(private loginService: LoginService, private studentService: StudentService, private router: Router) {
  }

  ngOnInit() {
  }
  
  LoginForm = new FormGroup({
    email: new FormControl('', [Validators.required, Validators.email]),
    password: new FormControl('', [Validators.required])
  })

  onSubmit() {
    var i = 1;
    if(i == 1){        
      this.loginService.login(this.LoginForm.value).subscribe(
        (res1) => {
          this.access_token = res1.json().access_token;
          i = 0;
          if(i == 0){
            this.studentService.storeToken(res1.json().access_token);
            this.loginService.me(res1.json().access_token).subscribe(
              (res2) => {
                console.log(res2.json().role_id);
                if(res2.json().role_id == 2){
                  this.router.navigate(['/admin']);
                }
                else{
                  this.router.navigate(['/user']);
                }
              }
            );
          }   
        },
        (err) => {
          console.log(err);
        }
      );
      
    }
    //this.router.navigate(['/admin']);
  }

  show() {
    this.type = "text";
  }

  hide() {
    this.type = "password";
  }
}
