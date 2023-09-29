import 'package:efficura/widgets/general/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/general/button.dart';
import '../../widgets/general/popup.dart';
import '../../models/login/access_token_model.dart';
import '../../providers/user_provider.dart';
import '../../services/login/post/post_login.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isBusy = false;

  logIn(BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    setState(() {
      isBusy = true;
    });

    AccessToken response = await userSignIn(
      context: context,
      request: UserSignInRequest(
        userEmail: userName.text.trim().toLowerCase(),
        userPassword: password.text.trim(),
      ),
    );

    setState(() {
      isBusy = false;
    });
    if (userProvider.statusCode == 200 || userProvider.statusCode == 201) {
      userProvider.email = userName.text.trim().toLowerCase();
      userProvider.password = password.text.trim();
      userProvider.accessToken = response.accessToken;
      userProvider.refreshToken = response.refreshToken;

      Navigator.of(context).pushNamedAndRemoveUntil("/home", (_) => false);
    } else {
      popup(
        context: context,
        title: "Warning",
        messages: ["Not Authorised"],
        type: PopupControlType.ok,
        icon: PopupControlIcon.warning,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        24.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Login to Your EffiCura account.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Form(
              key: widget._formKey,
              child: Column(
                children: [
                  TextInputControl(
                    type: TextInputControlType.textBold,
                    placeholder: "Username *",
                    controller: userName,
                    onChange: (value) {
                      // setState(() {
                      //   name = value;
                      // });
                    },
                  ),
                  const SizedBox(height: 24),
                  TextInputControl(
                    placeholder: "Password *",
                    controller: password,
                    type: TextInputControlType.password,
                    onChange: (value) {
                      // password.text = value;
                      //userProvider.password = value;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: ButtonControl(
                title: "Login",
                onTap: () async {
                  logIn(context);
                },
                isBusy: false,
                type: ButtonControlType.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
