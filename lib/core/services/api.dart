import 'dart:convert';

import 'package:flutterproviderarchitecture/core/models/comment.dart';
import 'package:flutterproviderarchitecture/core/models/post.dart';
import 'package:flutterproviderarchitecture/core/models/user.dart';
import 'package:http/http.dart' as http;

class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  Future<User> getUserProfile(int userId) async {
    var url = "$endpoint/users/$userId";
    final uri = Uri.parse(url);

    // Get user profile for id
    var response = await http.get(uri);

    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var url = "$endpoint/posts?userId=$userId";
    final uri = Uri.parse(url);

    var posts = <Post>[];
    // Get user posts for id
    var response = await http.get(uri);

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var url = "$endpoint/comments?postId=$postId";
    final uri = Uri.parse(url);

    var comments = <Comment>[];

    // Get comments for post
    var response = await http.get(uri);

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
