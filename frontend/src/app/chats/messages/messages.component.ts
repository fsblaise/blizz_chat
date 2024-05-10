import { Component } from '@angular/core';
import { MatIcon } from '@angular/material/icon';
import { MatToolbar } from '@angular/material/toolbar';
import { ActivatedRoute } from '@angular/router';
import { TextFieldComponent } from '../../../shared/components/text-field/text-field.component';
import { MatButtonModule } from '@angular/material/button';

@Component({
  selector: 'app-messages',
  standalone: true,
  imports: [MatToolbar, MatIcon, TextFieldComponent, MatButtonModule],
  templateUrl: './messages.component.html',
  styleUrl: './messages.component.css'
})
export class MessagesComponent {
  id!: string;
  constructor(private route: ActivatedRoute) {}

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.id = params['id'];
    })
  }
}
