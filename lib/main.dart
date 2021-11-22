import 'package:flutter/material.dart';
import 'package:flutterproviderarchitecture/ui/router.dart';
import 'package:provider/provider.dart';

import 'core/models/user.dart';
import 'core/services/authentication_service.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
        initialData: User.initial(),
        create: (context) => locator<AuthenticationService>().userController.stream,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          initialRoute: 'login',
          onGenerateRoute: router.generateRoute,
        ),);
  }
}
