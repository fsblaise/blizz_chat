import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButton } from '@angular/material/button';
import { MatCheckbox } from '@angular/material/checkbox';
import { Component, OnInit } from '@angular/core';
import { Router, RouterLink, RouterOutlet } from '@angular/router';
import { AuthService } from '../shared/services/auth.service';
import { CompanyService } from '../shared/services/company.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, MatToolbarModule, MatButton, RouterLink],
  schemas: [],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit {
  title = 'blizz-chat-web';

  constructor(protected router: Router, private auth: AuthService, private companyService: CompanyService) {}

  ngOnInit(): void {
    
  }
}
