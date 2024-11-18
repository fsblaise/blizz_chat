import { FormControl, FormGroup, Validators } from '@angular/forms';

export function getCompanyForm() {
  const formGroup = new FormGroup({
    name: new FormControl('', [
      Validators.required,
      Validators.minLength(3),
    ]),
    apiUrl: new FormControl('', [
      Validators.required,
      Validators.pattern(/^(https?):\/\/([a-zA-Z0-9.-]+):([0-9]{1,5})$/),
    ]),
  });
  return formGroup;
}
