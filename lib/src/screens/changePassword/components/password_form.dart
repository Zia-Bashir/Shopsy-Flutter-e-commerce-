import 'package:flutter/material.dart';
import 'package:shopsy/src/controllers/auth_controller.dart';
import 'package:shopsy/src/extension/form_validate.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:shopsy/src/widgets/textfiled_widget.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({super.key});

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
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
          TextFieldWidget(
            controller: passwordController,
            hintText: tReEneterPassword,
            lable: tConfirmPassword,
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

          //* --- Elevated Button

          SizedBox(
            height: elevatedBetweenSize,
          ),

          MyElevatedButtonWidget(
              ontap: () {
                if (_formKey.currentState!.validate()) {
                  AuthController.instance
                      .changePassword(passwordController.text.trim());
                  // Get.to(() => const LoginScreen());
                }
              },
              text: tContinue),
        ],
      ),
    );
  }
}
