class SignUpForm {
  SignUpForm({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  String name;
  String email;
  String password;
  String confirmPassword;

  String? get nameValidator {
    if (name.isEmpty) {
      return 'Name is missing';
    }
    return null;
  }

  String? get emailValidator {
    if (email.isEmpty) {
      return 'Email is missing';
    }
    return null;
  }

  String? get passwordValidator {
    if (password.isEmpty) {
      return 'Password is missing';
    }
    return null;
  }

  String? get confirmPasswordValidator {
    if (confirmPassword.isEmpty) {
      return 'Confirm password is missing';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  bool get isAuthStepValid =>
      email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty && password == confirmPassword;

  bool get isValid =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword;
}
