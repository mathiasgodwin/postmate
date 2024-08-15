import 'package:flutter/material.dart';
import 'package:postmate/feature/postmate/viewmodels/post_view_model.dart';
import 'package:postmate/feature/postmate/views/post_details_view.dart';
import 'package:provider/provider.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Posts'),
      ),
      body: Consumer<PostViewModel>(
        builder: (context, postProvider, child) {
          if (postProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (postProvider.error != null) {
            return Center(child: Text(postProvider.error!));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: postProvider.posts.length,
              itemBuilder: (context, index) {
                final post = postProvider.posts[index];
                return ListTile(
                  title: Text(post.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailView(postId: post.id),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
