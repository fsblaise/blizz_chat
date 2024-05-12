import { Component } from '@angular/core';
import { MatSidenavModule } from '@angular/material/sidenav'
import { MatListModule } from '@angular/material/list'
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInput } from '@angular/material/input';
import { MatIcon } from '@angular/material/icon';
import { MatButtonToggleModule } from '@angular/material/button-toggle';
import { Router, RouterLink, RouterOutlet } from '@angular/router';
import { TextFieldComponent } from '../../shared/components/text-field/text-field.component';

@Component({
  selector: 'app-chats',
  standalone: true,
  imports: [RouterOutlet, MatSidenavModule, MatListModule, MatFormFieldModule, MatInput, MatIcon, MatButtonToggleModule, RouterLink, TextFieldComponent],
  templateUrl: './chats.component.html',
  styleUrl: './chats.component.css'
})
export class ChatsComponent {
  searchWord!: string;
  active = -1;
  chats: string[] = ['Test User1', 'Test User2', 'Test User3', 'Test User4', 'Test User5', 'Test User6'];
  constructor(private router: Router) {}

  ngOnInit(): void {
    const url = this.router.url.split('/').pop();
    const decoded = decodeURIComponent(url as string);
    this.active = this.chats.includes(decoded) ? this.chats.findIndex(value => value === decoded) : -1;
  }
}
