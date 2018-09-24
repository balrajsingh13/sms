import { Component, OnInit } from '@angular/core';
import { StudentService } from '../student.service';
import { Router } from '@angular/router';
import { Student } from '../student';

@Component({
  selector: 'app-admin-panel',
  templateUrl: './admin-panel.component.html',
  styleUrls: ['./admin-panel.component.css']
})
export class AdminPanelComponent implements OnInit {

  length: number;
  id: number;
  instance: any;
  student_list: Array<{id: number, name: string, email: string, password: string, role_id: number, course_id: number}> = [];  
  constructor(private studentService: StudentService, private router: Router) { }

  ngOnInit() {
    this.studentService.getDetails().subscribe(
      (res) => {
        console.log(res);
        for(var i=0; i<res.json().data.length; i++){

          this.instance = { 'name': res.json().data[i].name,
            'email': res.json().data[i].email,
            'course_id': res.json().data[i].course_id,};

          this.student_list.push( 
            this.instance
          );
          console.log(this.student_list);
        }
      }
    );
  }

  create() {
    this.router.navigate(['register-new-student']);
  }

}
