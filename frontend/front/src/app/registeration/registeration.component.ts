import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { StudentService } from '../student.service';


@Component({
  selector: 'app-registeration',
  templateUrl: './registeration.component.html',
  styleUrls: ['./registeration.component.css']
})
export class RegisterationComponent implements OnInit {

  ngOnInit() {
  }

  constructor(private studentService: StudentService, private router: Router) {
  }
  
  RegistrationForm = new FormGroup({
    name: new FormControl('', [Validators.required, Validators.pattern('[A-Za-z]+')]),
    email: new FormControl('', [Validators.required, Validators.email]),
    password: new FormControl('', [Validators.required, Validators.pattern('^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$')]),
    //cpassword: new FormControl('', [Validators.required]),
    role: new FormControl('', [Validators.required,]),
    course: new FormControl('', [Validators.required,])
  })

  onSubmit() {
    this.studentService.setData(this.RegistrationForm.value).subscribe();
    //this.router.navigate(['/display']);
  }

}

