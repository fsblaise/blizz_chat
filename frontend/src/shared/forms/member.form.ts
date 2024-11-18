import { FormControl, FormGroup, Validators } from '@angular/forms';

export function getMemberForm() {
  const formGroup = new FormGroup({
    name: new FormControl('', [
      Validators.required,
      Validators.minLength(3),
    ]),
    role: new FormControl('', [
      Validators.required,
      Validators.pattern(/^(admin|owner|member)$/),
    ]),
    email: new FormControl('', [
      Validators.required,
      Validators.email,
    ]),
  });
  return formGroup;
}
