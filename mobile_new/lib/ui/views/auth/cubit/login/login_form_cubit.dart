import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.dart';
part 'login_form_cubit.freezed.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit() : super(LoginFormState.initial());

  void updateEmail(String email) {
    emit(
      state.copyWith(
        email: email,
        emailError: _validateEmail(email),
      ),
    );
    _validateForm();
  }

  void updatePassword(String password) {
    emit(
      state.copyWith(
        password: password,
        passwordError: _validatePassword(password),
      ),
    );
    _validateForm();
  }

  String? _validateEmail(String email) {
    const regex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (email.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(regex).hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 6) {
      return 'Password should be at least 6 characters long.';
    }
    return null;
  }

  void _validateForm() {
    final isValid = state.emailError == null &&
        state.passwordError == null &&
        state.email.isNotEmpty &&
        state.password.isNotEmpty;
    emit(state.copyWith(isValid: isValid));
  }
}
