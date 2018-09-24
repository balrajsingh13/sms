import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';

import { RouterModule, Routes } from '@angular/router';
import { ReactiveFormsModule } from '@angular/forms';
import { LoginService } from './login.service';
import { AdminPanelComponent } from './admin-panel/admin-panel.component';
import { UserPanelComponent } from './user-panel/user-panel.component';
import { StudentService } from './student.service';
import { RegisterationComponent } from './registeration/registeration.component';

const routes: Routes = [{
  path: '',
  component: LoginComponent
},
{
  path: 'admin',
  component: AdminPanelComponent
},
{
  path: 'user',
  component: UserPanelComponent
},
{
  path: 'register-new-student',
  component: RegisterationComponent
}
]

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    AdminPanelComponent,
    UserPanelComponent,
    RegisterationComponent
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule,
    RouterModule.forRoot(routes),
    HttpModule
  ],
  providers: [
    LoginService,
    StudentService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
