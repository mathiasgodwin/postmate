import 'dart:async';

import 'package:postmate/feature/postmate/models/comment_model.dart';
import 'package:postmate/feature/postmate/models/post_model.dart';

class ApiService {
  // Simulate fetching posts from an API
  Future<List<PostModel>> fetchPosts() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      return [
        PostModel(id: 1, title: 'First Post'),
        PostModel(id: 2, title: 'Second Post'),
        PostModel(id: 3, title: 'Third Post'),
      ];
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }

  // Simulate fetching comments for a specific post
  Future<List<CommentModel>> fetchComments(int postId) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      if (postId == 1) {
        return [
          CommentModel(
              id: 1, postId: 1, content: 'First Comment on First Post'),
          CommentModel(
              id: 2, postId: 1, content: 'Second Comment on First Post'),
        ];
      } else if (postId == 2) {
        return [
          CommentModel(
              id: 3, postId: 2, content: 'First Comment on Second Post'),
        ];
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load comments');
    }
  }
}
