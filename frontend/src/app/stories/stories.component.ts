import { Component } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatIcon } from '@angular/material/icon';

@Component({
  selector: 'app-stories',
  standalone: true,
  imports: [MatCardModule, MatIcon],
  templateUrl: './stories.component.html',
  styleUrl: './stories.component.css'
})
export class StoriesComponent {
  stories: string[] = ['Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User','Test User'];
}
