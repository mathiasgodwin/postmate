import 'package:flutter/material.dart';
import 'package:postmate/configs/theme.dart';
import 'package:postmate/feature/postmate/services/api_service.dart';
import 'package:postmate/feature/postmate/viewmodels/comment_view_model.dart';
import 'package:postmate/feature/postmate/viewmodels/post_view_model.dart';
import 'package:postmate/feature/postmate/views/post_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostViewModel(apiService: apiService)..fetchPosts(),
        ),
        ChangeNotifierProvider(
          create: (_) => CommentsViewModel(apiService: apiService),
        ),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MaterialTheme(Theme.of(context).textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Post Mate',
      theme: theme.light(),
      darkTheme: theme.dark(),
      home: const PostListView(),
    );
  }
}
