part of 'messaging_cubit.dart';

@freezed
class MessagingState with _$MessagingState {
  const factory MessagingState.initial() = MessagingInitial;
  const factory MessagingState.fetching() = MessagingFetching;
  const factory MessagingState.fetched({
    required List<Message> messages,
    required String chatId,
  }) = MessagingFetched;
  const factory MessagingState.error({
    required String message,
  }) = MessagingError;
}
