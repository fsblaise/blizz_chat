part of 'chats_cubit.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState.initial() = ChatsInitial;
  const factory ChatsState.fetching() = ChatsFetching;
  const factory ChatsState.fetched({
    required List<Chat> chats,
  }) = ChatsFetched;
  const factory ChatsState.error({
    required String message,
  }) = ChatsError;
}
