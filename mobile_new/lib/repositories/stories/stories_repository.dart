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

  Future<Story> createStory(CreateStoryDto dto, MultipartFile file) async {
    try {
      final createStoryDtoJson = jsonEncode(dto.toJson());
      final response = await service.createStory(createStoryDtoJson, file);
      if (response.isSuccessful) {
        final decodedResponse =
            jsonDecode(response.bodyString) as Map<String, dynamic>;
        print(decodedResponse);
        return Story.fromJson(decodedResponse);
      } else {
        throw Exception('Failed to create story');
      }
    } catch (e) {
      throw Exception('Failed to create story: $e');
    }
  }

  // Future<Response<dynamic>> findOne(String id) async {
  //   try {
  //     final response = await service.findOne(id);
  //     if (response.isSuccessful) {
  //       return response;
  //     } else {
  //       throw Exception('Failed to find story');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to find story: $e');
  //   }
  // }

  Future<Response<dynamic>> delete(String id) async {
    try {
      final response = await service.delete(id);
      if (response.isSuccessful) {
        return response;
      } else {
        throw Exception('Failed to delete story');
      }
    } catch (e) {
      throw Exception('Failed to delete story: $e');
    }
  }
}
