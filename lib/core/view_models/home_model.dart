import 'package:flutterproviderarchitecture/core/models/post.dart';
import 'package:flutterproviderarchitecture/core/services/posts_service.dart';
import 'package:flutterproviderarchitecture/locator.dart';

import '../enums.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  final PostsService _postsService = locator<PostsService>();

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postsService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
