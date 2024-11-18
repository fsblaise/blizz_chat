import { Routes } from '@angular/router';
import { WelcomeComponent } from './welcome/welcome.component';
import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';
import { ProfileComponent } from './profile/profile.component';
import { PersonalComponent } from './profile/personal/personal.component';
import { SecurityComponent } from './profile/security/security.component';
import { PreferencesComponent } from './profile/preferences/preferences.component';
import { CompanyComponent } from './company/company.component';
import { AuthGuard } from '../shared/guards/auth.guard';

export const routes: Routes = [
    { path: 'welcome', component: WelcomeComponent },
    { path: 'signup', component: RegisterComponent },
    { path: 'login', component: LoginComponent },
    { path: 'workspace', component: CompanyComponent, canActivate: [AuthGuard] },
    {
        path: 'profile', component: ProfileComponent, 
        canActivate: [AuthGuard],
        children: [
            { path: 'personal', component: PersonalComponent },
            { path: 'security', component: SecurityComponent },
            { path: 'preferences', component: PreferencesComponent },
            { path: '**', redirectTo: '/profile/personal' },
        ],
    },
    { path: '**', redirectTo: '/welcome' },
];
