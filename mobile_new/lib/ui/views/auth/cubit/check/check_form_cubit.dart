import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_form_state.dart';
part 'check_form_cubit.freezed.dart';

class CheckFormCubit extends Cubit<CheckFormState> {
  CheckFormCubit() : super(CheckFormState.initial());

  void updateEmail(String email) {
    emit(
      state.copyWith(
        email: email,
        emailError: _validateEmail(email),
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

  void _validateForm() {
    final isValid = state.emailError == null && state.email.isNotEmpty;
    emit(state.copyWith(isValid: isValid));
  }

  Future<List<Company>?> checkEmail(String email) async {
    return await CompaniesRepository.checkIfEmailInCompany(email);
    // no need for the result, the company won't be saved or anything
    // api url and session is already saved and handled in the repository
  }

  Future<void> selectCompany(Company company, String email) async {
    await CompaniesRepository.selectCompany(company, email);
  }
}
