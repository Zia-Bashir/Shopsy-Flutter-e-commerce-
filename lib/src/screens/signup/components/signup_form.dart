import 'package:flutter/material.dart';
import 'package:shopsy/src/controllers/auth_controller.dart';
import 'package:shopsy/src/extension/form_validate.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:shopsy/src/widgets/textfiled_widget.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: defaultPaddingHight,
          ),
          //* -- Input fileds
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldWidget(
                controller: emailController,
                hintText: tEmailText,
                lable: tEmail,
                icon: Icons.email_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Your Email is required";
                  } else if (!isValidEmail(value)) {
                    return "Enter your valid Email";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: passwordController,
                hintText: tPasswordText,
                lable: tPassword,
                obsureText: true,
                icon: Icons.password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  } else if (!isValidPassword(value)) {
                    return "Your Password should contains A-Z, \na-z,0-9 and a special character";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: confirmPasswordController,
                hintText: tReEneterPassword,
                lable: tConfirmPassword,
                icon: Icons.password,
                obsureText: true,
                validator: (value) {
                  if (confirmPasswordController.text !=
                      passwordController.text) {
                    return "Your password didn't match";
                  }
                  return null;
                },
              ),
            ],
          ),

          //* --- Elevated Button

          SizedBox(
            height: elevatedBetweenSize,
          ),
          MyElevatedButtonWidget(
              ontap: () {
                if (_formKey.currentState!.validate()) {
                  AuthController.instance.registration(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                }
              },
              text: tContinue),
        ],
      ),
    );
  }
}
