part of 'check_form_cubit.dart';

@freezed
class CheckFormState with _$CheckFormState {
  const factory CheckFormState({
    required String email,
    required bool isValid,
    String? emailError,
  }) = _CheckFormState;

  factory CheckFormState.initial() => const CheckFormState(
        email: '',
        isValid: false,
      );
}
