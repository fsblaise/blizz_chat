import { Component, CUSTOM_ELEMENTS_SCHEMA, ViewEncapsulation } from '@angular/core';

@Component({
  selector: 'card',
  standalone: true,
  imports: [],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  templateUrl: './card.component.html',
  styleUrl: './card.component.css',
  encapsulation: ViewEncapsulation.None
})
export class CardComponent {

}
