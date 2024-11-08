part of '../repositories.dart';

class StoriesRepository extends RepositoryInterface<StoriesService> {
  factory StoriesRepository() {
    return _singleton;
  }
  StoriesRepository._internal();

  static final StoriesRepository _singleton = StoriesRepository._internal();

  Future<List<Story>> getStories() async {
    try {
      final response = await service.findAll();
      if (response.isSuccessful) {
        final decodedResponse = jsonDecode(response.bodyString);
        print(decodedResponse);
        return (decodedResponse as List<dynamic>)
            .map((story) => Story.fromJson(story as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load stories');
      }
    } catch (e) {
      throw Exception('Failed to load stories: $e');
    }
  }
}
