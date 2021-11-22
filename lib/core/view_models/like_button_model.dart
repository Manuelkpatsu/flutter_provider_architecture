import 'package:flutterproviderarchitecture/core/services/posts_service.dart';
import 'package:flutterproviderarchitecture/core/view_models/base_model.dart';

import '../../locator.dart';

class LikeButtonModel extends BaseModel {
  final PostsService _postsService = locator<PostsService>();

  int postLikes(int postId) {
    return _postsService.posts.firstWhere((post) => post.id == postId).likes;
  }

  void increaseLikes(int postId) {
    _postsService.incrementLikes(postId);
    notifyListeners();
  }
}
