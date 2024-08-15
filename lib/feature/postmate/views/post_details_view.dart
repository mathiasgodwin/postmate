import 'package:flutter/material.dart';
import 'package:postmate/feature/postmate/viewmodels/comment_view_model.dart';
import 'package:provider/provider.dart';

class PostDetailView extends StatefulWidget {
  final int postId;

  const PostDetailView({super.key, required this.postId});

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  late Future<void> _fetchCommentsFuture;

  @override
  void initState() {
    super.initState();
    _fetchCommentsFuture = _fetchComments();
  }

  Future<void> _fetchComments() async {
    final commentProvider =
        Provider.of<CommentsViewModel>(context, listen: false);
    await commentProvider.fetchComments(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    final commentProvider = context.read<CommentsViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Comments'),
      ),
      body: FutureBuilder(
        future: _fetchCommentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            if (commentProvider.comments.isEmpty) {
              return const Center(
                child: Text('Empty comment for this post!'),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: commentProvider.comments.length,
              itemBuilder: (context, index) {
                final comment = commentProvider.comments[index];
                return ListTile(
                  title: Text(comment.content),
                );
              },
            );
          }
        },
      ),
    );
  }
}
