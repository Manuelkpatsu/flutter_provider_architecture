// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutterproviderarchitecture/core/models/post.dart';

import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/post_view.dart';

class router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
