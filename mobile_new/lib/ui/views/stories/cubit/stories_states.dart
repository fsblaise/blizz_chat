part of 'stories_cubit.dart';

@freezed
class StoriesState with _$StoriesState {
  const factory StoriesState.initial() = StoriesInitial;
  const factory StoriesState.fetching() = StoriesFetching;
  const factory StoriesState.fetched({
    required List<Story> stories,
  }) = StoriesFetched;
  const factory StoriesState.error({
    required String message,
  }) = StoriesError;
}
