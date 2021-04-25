import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:flutter_dev_quiz/screens/login/login_controller.dart';
import 'package:flutter_dev_quiz/screens/login/login_state.dart';
import 'package:flutter_dev_quiz/screens/login/widgets/input_box/input_box_widget.dart';
import 'package:flutter_dev_quiz/shared/widgets/button/button_widget.dart';
import 'package:flutter_dev_quiz/shared/widgets/button_link/button_link_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  final controller = LoginController();

  final TextEditingController _textController = TextEditingController();
  bool isGithubUser = true;

  @override
  Widget build(BuildContext context) {
    void navigateToHome() {
      Navigator.of(context)
          .pushReplacementNamed("/home", arguments: controller.user);
    }

    void onSubmitted() async {
      FocusManager.instance.primaryFocus?.unfocus();
      if (isGithubUser) {
        await controller.fetchGitHubUser(_textController.text, navigateToHome);
      } else {
        await controller.createUserByName(_textController.text);
        navigateToHome();
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView(
            children: [
              Center(
                heightFactor: 1.5,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.smallLogo),
                        SizedBox(height: 20),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InputBoxWidget(
                              error: controller.state == LoginState.error,
                              controller: _textController,
                              label: isGithubUser ? "Github" : "Nome",
                              onSubmitted: onSubmitted,
                              hintText: isGithubUser
                                  ? "githubuser"
                                  : "Digite seu nome",
                            ),
                            SizedBox(height: 20),
                            ButtonLinkWidget(
                              text: isGithubUser
                                  ? "Não tenho Github"
                                  : "Entrar com Github",
                              onPressed: () {
                                setState(() {
                                  isGithubUser = !isGithubUser;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ButtonWidget(
                                label: "Login",
                                animation: true,
                                isLoading:
                                    controller.state == LoginState.loading,
                                onPress: onSubmitted,
                                variant: "secondary")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
