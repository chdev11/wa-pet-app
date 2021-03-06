import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:wa_pet_app/app/modules/login/presenter/states/login_state.dart';
import 'package:wa_pet_app/app/modules/login/presenter/stores/login_store.dart';
import 'package:wa_pet_app/shared/utils/colors.dart';
import 'package:wa_pet_app/shared/utils/constants.dart';
import 'package:wa_pet_app/shared/utils/images.dart';
import 'package:wa_pet_app/shared/widgets/custom_button_widget.dart';
import 'package:wa_pet_app/shared/widgets/custom_textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = Modular.get<LoginStore>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String tag = "";

  @override
  void initState() {
    tag = runtimeType.toString().replaceFirst("_", "").replaceAll("State", "");

    reaction<ILoginState>((_) => store.state, (state) {
      if (state is LoginError) {
        log("Login Error: ${state.error.message}", name: tag);
        ScaffoldMessenger.maybeOf(context)
            ?.showSnackBar(SnackBar(content: Text(state.error.message)));
      } else if (state is LoginLoading) {
        log("Login Loading", name: tag);
      } else if (state is LoginSuccess) {
        log("User logged in successfully", name: tag);
        Modular.to.navigate("/home/");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(smallPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Padding(
                    padding: const EdgeInsets.all(smallPadding),
                    child: Image.asset(
                      mainLogo,
                      height: 150,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  CustomTextFieldWidget(
                    maxLines: 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(smallPadding),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    showBorder: false,
                    controller: usernameController,
                    hintText: "E-mail",
                    onChanged: store.onChangeEmail,
                    onSubmited: (_) => _login(),
                  ),
                  const SizedBox(height: 5),
                  CustomButtonWidget(
                    height: 35,
                    onPressed: () => _login(),
                    text: "Login",
                    color: MaterialStateProperty.resolveWith(
                        (states) => lightBlue),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      sndLogo,
                    ),
                    radius: 50,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Future<void> _login() async {
    await store.login();
    usernameController.text = "";
    passwordController.text = "";
    store.onChangeEmail('');
  }
}
