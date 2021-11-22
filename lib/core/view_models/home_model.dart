import 'package:flutterproviderarchitecture/core/models/post.dart';
import 'package:flutterproviderarchitecture/core/services/api.dart';
import 'package:flutterproviderarchitecture/locator.dart';

import '../enums.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  final Api _api = locator<Api>();

  late List<Post> posts;

  Future getPosts(int userId) async {
    print(userId);
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    print(posts);
    setState(ViewState.Idle);
  }
}
