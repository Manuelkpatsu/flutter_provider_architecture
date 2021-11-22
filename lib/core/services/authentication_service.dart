// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:flutterproviderarchitecture/core/models/user.dart';

import '../../locator.dart';
import 'api.dart';

class AuthenticationService {
  // Inject our Api
  final Api _api = locator<Api>();
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetcheduser = await _api.getUserProfile(userId);

    var hasUser = fetcheduser != null;
    if (hasUser) {
      userController.add(fetcheduser);
    }

    return hasUser;
  }
}
