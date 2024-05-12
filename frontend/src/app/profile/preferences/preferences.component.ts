import { Component } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { MatButton } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIcon } from '@angular/material/icon';
import { MatInput } from '@angular/material/input';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatMenuModule } from '@angular/material/menu';
import { NgClass } from '@angular/common';
import { DarkModeSwitchComponent } from '../../../shared/components/dark-mode-switch/dark-mode-switch.component';

@Component({
  selector: 'app-preferences',
  standalone: true,
  imports: [MatFormFieldModule, MatInput, MatIcon, MatButton, ReactiveFormsModule, MatSlideToggleModule, MatMenuModule, NgClass, DarkModeSwitchComponent],
  templateUrl: './preferences.component.html',
  styleUrl: './preferences.component.css'
})
export class PreferencesComponent {
  preferredChatColor = 'bg-[var(--md-sys-color-primary)]';
}
