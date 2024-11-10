import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' show MultipartFile;

part 'stories_states.dart';
part 'stories_cubit.freezed.dart';

class StoriesCubit extends Cubit<StoriesState> {
  StoriesCubit() : super(StoriesState.initial());

  Future<void> fetchStories() async {
    emit(StoriesState.fetching());
    try {
      final stories = await StoriesRepository().getStories();
      emit(StoriesState.fetched(stories: stories));
    } catch (e) {
      emit(StoriesState.error(message: e.toString()));
    }
  }

  Future<void> createStory(CreateStoryDto dto, MultipartFile file) async {
    final currentState = state;
    try {
      emit(StoriesState.fetching());
      final story = await StoriesRepository().createStory(dto, file);
      if (currentState is StoriesFetched) {
        final updatedStories = List<Story>.from(currentState.stories)
          ..add(story);
        emit(currentState.copyWith(stories: updatedStories));
      } else {
        emit(StoriesState.fetched(stories: [story]));
      }
    } catch (e) {
      // TODO: errorstates should be checked in listener
      // in the listener a snackbar should be shown
      // after that, the state should be reset to the previous state
      // emit(StoriesState.error(message: e.toString()));
      print(e);
      emit(currentState);
    }
  }

  Future<void> delete(String id) async {
    final currentState = state;
    try {
      await StoriesRepository().delete(id);
      if (currentState is StoriesFetched) {
        final updatedStories = List<Story>.from(currentState.stories)
          ..removeWhere((story) => story.id == id);
        emit(currentState.copyWith(stories: updatedStories));
      }
    } catch (e) {
      print(e);
      emit(currentState);
    }
  }
}
