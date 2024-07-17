import { Component, Input } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { MatIcon } from '@angular/material/icon';

@Component({
  selector: 'text-field',
  standalone: true,
  imports: [MatIcon, FormsModule],
  templateUrl: './text-field.component.html',
  styleUrl: './text-field.component.css'
})
export class TextFieldComponent {
  @Input() searchWord!: string;
  @Input() prompt: string = "Aa";
  @Input() isSearch: boolean = false;
}
