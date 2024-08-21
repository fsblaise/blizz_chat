import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_form_state.dart';
part 'register_form_cubit.freezed.dart';

class RegisterFormCubit extends Cubit<RegisterFormState> {
  RegisterFormCubit() : super(RegisterFormState.initial());

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

  void updateRePassword(String rePassword) {
    emit(
      state.copyWith(
        rePassword: rePassword,
        rePasswordError: _validateRePassword(rePassword),
      ),
    );
    _validateForm();
  }

  void updateFullName(String fullName) {
    emit(
      state.copyWith(
        fullName: fullName,
        fullNameError: _validateFullName(fullName),
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

  String? _validateRePassword(String rePassword) {
    if (rePassword.isEmpty) {
      return 'Password is required';
    } else if (rePassword.length < 6) {
      return 'Password should be at least 6 characters long.';
    } else if (state.password != rePassword) {
      return 'Passwords should match.';
    }
    return null;
  }

  String? _validateFullName(String fullName) {
    if (fullName.isEmpty) {
      return 'Full name is required';
    } else if (fullName.length < 6) {
      return 'Full name should be at least 6 characters long.';
    }
    return null;
  }

  void _validateForm() {
    final isStepOneValid = state.emailError == null &&
        state.passwordError == null &&
        state.rePasswordError == null &&
        state.email.isNotEmpty &&
        state.password.isNotEmpty &&
        state.rePassword.isNotEmpty;
    emit(state.copyWith(isStepOneValid: isStepOneValid));

    final isValid = state.emailError == null &&
        state.passwordError == null &&
        state.rePasswordError == null &&
        state.fullNameError == null &&
        state.email.isNotEmpty &&
        state.password.isNotEmpty &&
        state.rePassword.isNotEmpty &&
        state.fullName.isNotEmpty;
    emit(state.copyWith(isValid: isValid));
  }
}
