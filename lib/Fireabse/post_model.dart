import 'dart:convert';

// Model class for Post
class Post {
  final int id;
  final String title;
  final String body;

  // Constructor
  Post({required this.id, required this.title, required this.body});

  // Factory method to create a Post from JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['id'], title: json['title'], body: json['body']);
  }
}
