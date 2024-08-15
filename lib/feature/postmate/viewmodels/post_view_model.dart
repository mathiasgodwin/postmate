import 'package:flutter/material.dart';
import 'package:postmate/feature/postmate/models/post_model.dart';
import 'package:postmate/feature/postmate/services/api_service.dart';
import 'package:provider/provider.dart';

class PostViewModel with ChangeNotifier {
  final ApiService apiService;
  List<PostModel> posts = [];
  bool isLoading = false;
  String? error;

  PostViewModel({required this.apiService});

  Future<void> fetchPosts() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      posts = await apiService.fetchPosts();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
