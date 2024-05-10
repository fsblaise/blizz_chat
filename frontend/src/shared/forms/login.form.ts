import { FormControl, FormGroup, Validators } from '@angular/forms';

export function getLogInForm() {
  return new FormGroup({
    email: new FormControl('', [
      Validators.required,
      Validators.email,
    ]),
    password: new FormControl('', [
      Validators.required,
      Validators.minLength(6),
    ]),
  });
}
