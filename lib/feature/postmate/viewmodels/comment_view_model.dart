import 'package:flutter/material.dart';
import 'package:postmate/feature/postmate/models/comment_model.dart';
import 'package:postmate/feature/postmate/services/api_service.dart';

class CommentsViewModel with ChangeNotifier {
  final ApiService apiService;
  List<CommentModel> comments = [];
  bool isLoading = true;
  String? error;

  CommentsViewModel({required this.apiService});

  Future<void> fetchComments(int postId) async {
    error = null;
    try {
      comments = await apiService.fetchComments(postId);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
