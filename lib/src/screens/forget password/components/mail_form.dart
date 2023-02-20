import 'package:flutter/material.dart';
import 'package:shopsy/src/controllers/auth_controller.dart';
import 'package:shopsy/src/extension/form_validate.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:shopsy/src/widgets/textfiled_widget.dart';

class MailForm extends StatefulWidget {
  const MailForm({super.key});

  @override
  State<MailForm> createState() => _MailFormState();
}

class _MailFormState extends State<MailForm> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
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

          //* --- Elevated Button

          SizedBox(
            height: elevatedBetweenSize,
          ),
          MyElevatedButtonWidget(
              ontap: () {
                if (_formKey.currentState!.validate()) {
                  AuthController.instance
                      .forgetPassword(emailController.text.trim());
                }
              },
              text: tContinue),
        ],
      ),
    );
  }
}
