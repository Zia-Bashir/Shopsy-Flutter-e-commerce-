import 'package:flutter/material.dart';
import 'package:shopsy/src/controllers/auth_controller.dart';
import 'package:shopsy/src/extension/form_validate.dart';
import 'package:shopsy/src/screens/login/components/forget_password.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';
import 'package:shopsy/src/widgets/textfiled_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
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
                  }
                  return null;
                },
              ),
            ],
          ),

          //* --- Remeber/Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (_) {},
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return AppColors.secondaryColor;
                      }
                      return AppColors.mainColor;
                    }),
                  ),
                  MyTextWidget(title: tRememberMe, style: style.subtitle1),
                ],
              ),
              //* --- Forget Password
              ForgetPassword(style: style),
            ],
          ),

          //* --- Elevated Button

          SizedBox(
            height: elevatedBetweenSize,
          ),
          MyElevatedButtonWidget(
              ontap: () async {
                if (_formKey.currentState!.validate()) {
                  AuthController.instance.login(emailController.text.trim(),
                      passwordController.text.trim());
                }
              },
              text: tContinue),
        ],
      ),
    );
  }
}
