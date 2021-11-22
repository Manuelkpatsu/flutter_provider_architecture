import 'package:flutter/material.dart';
import 'package:flutterproviderarchitecture/ui/views/base_view.dart';
import 'package:flutterproviderarchitecture/core/view_models/like_button_model.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  const LikeButton({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeButtonModel>(
      builder: (context, model, child) => Row(
        children: <Widget>[
          Text('Likes ${model.postLikes(postId)}'),
          MaterialButton(
            color: Colors.white,
            child: const Icon(Icons.thumb_up),
            onPressed: () {
              model.increaseLikes(postId);
            },
          ),
        ],
      ),
    );
  }
}
