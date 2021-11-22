import 'package:flutterproviderarchitecture/core/models/comment.dart';
import 'package:flutterproviderarchitecture/core/services/api.dart';

import '../../locator.dart';
import '../enums.dart';
import 'base_model.dart';

class CommentsModel extends BaseModel {
  final Api _api = locator<Api>();

  late List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
