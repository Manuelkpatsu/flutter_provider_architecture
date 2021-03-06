import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/services/authentication_service.dart';
import 'core/services/posts_service.dart';
import 'core/view_models/comments_model.dart';
import 'core/view_models/home_model.dart';
import 'core/view_models/like_button_model.dart';
import 'core/view_models/login_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => PostsService());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => LikeButtonModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}
