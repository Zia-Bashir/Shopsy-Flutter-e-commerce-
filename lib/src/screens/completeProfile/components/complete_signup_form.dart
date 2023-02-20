import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/controllers/auth_controller.dart';
import 'package:shopsy/src/screens/completeProfile/components/number_picker.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:shopsy/src/widgets/textfiled_widget.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CompleteSignUpForm extends StatefulWidget {
  const CompleteSignUpForm({super.key});

  @override
  State<CompleteSignUpForm> createState() => _CompleteSignUpFormState();
}

class _CompleteSignUpFormState extends State<CompleteSignUpForm> {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    firstController.dispose();
    lastController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var style = Theme.of(context).textTheme;
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
                controller: firstController,
                keyboard: TextInputType.name,
                hintText: tEnterFirstName,
                lable: tFirstName,
                icon: Icons.person_outline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Your first name is required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: lastController,
                keyboard: TextInputType.name,
                hintText: tEnterLastName,
                lable: tLastName,
                icon: Icons.person_outline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Your last name is required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: addressController,
                keyboard: TextInputType.streetAddress,
                hintText: tEnterAddress,
                lable: tAddress,
                icon: Icons.pin_drop_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Your address is required";
                  }
                  return null;
                },
              ),
              Form(
                key: _formKey2,
                child: NumberPicker(
                    number: number, phoneController: phoneController),
              ),
            ],
          ),

          //* --- Elevated Button

          SizedBox(
            height: elevatedBetweenSize,
          ),

          //* Elevated Button
          MyElevatedButtonWidget(
              ontap: () {
                if (_formKey.currentState!.validate() &&
                    _formKey2.currentState!.validate()) {
                  _formKey2.currentState!.save();

                  AuthController.instance.completeRegistration(
                      firstController.text.trim(),
                      lastController.text.trim(),
                      phoneController.text.trim(),
                      addressController.text.trim());
                  Get.offAllNamed("/success");
                }
              },
              text: tContinue),
        ],
      ),
    );
  }
}
