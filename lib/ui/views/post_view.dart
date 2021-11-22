import 'package:flutter/material.dart';
import 'package:flutterproviderarchitecture/core/models/post.dart';
import 'package:flutterproviderarchitecture/core/models/user.dart';
import 'package:flutterproviderarchitecture/ui/shared/app_colors.dart';
import 'package:flutterproviderarchitecture/ui/shared/text_styles.dart';
import 'package:flutterproviderarchitecture/ui/shared/ui_helpers.dart';
import 'package:flutterproviderarchitecture/ui/widgets/comments.dart';
import 'package:flutterproviderarchitecture/ui/widgets/like_button.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  final Post post;

  const PostView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: const TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            LikeButton(postId: post.id),
            Comments(post.id)
          ],
        ),
      ),
    );
  }
}
