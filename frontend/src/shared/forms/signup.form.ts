import { FormControl, FormGroup, Validators } from '@angular/forms';

export function getSignUpForm() {
  return new FormGroup({
    firstName: new FormControl('', [
      Validators.required,
      Validators.minLength(4),
    ]),
    lastName: new FormControl('', [
      Validators.required,
      Validators.minLength(4),
    ]),
    email: new FormControl('', [
      Validators.required,
      Validators.email,
    ]),
    password: new FormControl('', [
      Validators.required,
      Validators.minLength(6),
    ]),
    rePassword: new FormControl('', [
      Validators.required,
      Validators.minLength(6),
    ]),
  });
}
