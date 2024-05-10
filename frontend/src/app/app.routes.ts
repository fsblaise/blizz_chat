import { Routes } from '@angular/router';
import { WelcomeComponent } from './welcome/welcome.component';
import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';
import { ChatsComponent } from './chats/chats.component';
import { MapComponent } from './map/map.component';
import { StoriesComponent } from './stories/stories.component';
import { ProfileComponent } from './profile/profile.component';
import { MessagesComponent } from './chats/messages/messages.component';

export const routes: Routes = [
    { path: 'welcome', component: WelcomeComponent },
    { path: 'signup', component: RegisterComponent },
    { path: 'login', component: LoginComponent },
    { path: 'chats', component: ChatsComponent, children: [
        { path: ':id', component: MessagesComponent}
    ] },
    { path: 'stories', component: StoriesComponent },
    { path: 'map', component: MapComponent },
    { path: 'profile', component: ProfileComponent },
    { path: '**', redirectTo: '/welcome' },
];
