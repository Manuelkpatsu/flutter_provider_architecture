import 'package:flutter/material.dart';
import 'package:flutterproviderarchitecture/core/enums.dart';
import 'package:flutterproviderarchitecture/core/models/post.dart';
import 'package:flutterproviderarchitecture/core/models/user.dart';
import 'package:flutterproviderarchitecture/core/view_models/home_model.dart';
import 'package:flutterproviderarchitecture/ui/shared/app_colors.dart';
import 'package:flutterproviderarchitecture/ui/shared/text_styles.dart';
import 'package:flutterproviderarchitecture/ui/shared/ui_helpers.dart';
import 'package:flutterproviderarchitecture/ui/widgets/postList_item.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.getPosts(2);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Idle
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                UIHelper.verticalSpaceLarge(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Welcome ${Provider.of<User>(context).name}',
                    style: headerStyle,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('Here are all your posts', style: subHeaderStyle),
                ),
                UIHelper.verticalSpaceSmall(),
                Expanded(child: getPostsUi(model.posts)),
              ])
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, 'post', arguments: posts[index]);
          },
        ),
      );
}
