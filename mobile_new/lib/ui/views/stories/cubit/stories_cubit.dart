import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
}
