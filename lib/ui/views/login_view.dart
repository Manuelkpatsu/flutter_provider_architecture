import 'package:flutter/material.dart';
import 'package:flutterproviderarchitecture/core/enums.dart';
import 'package:flutterproviderarchitecture/core/view_models/login_view_model.dart';
import 'package:flutterproviderarchitecture/ui/shared/app_colors.dart';
import 'package:flutterproviderarchitecture/ui/views/base_view.dart';
import 'package:flutterproviderarchitecture/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(
              validationMessage: model.errorMessage,
              controller: controller,
            ),
            model.state == ViewState.Busy
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, '/');
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
