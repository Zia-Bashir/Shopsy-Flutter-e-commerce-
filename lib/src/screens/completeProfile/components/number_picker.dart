import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shopsy/src/utils/app_colors.dart';

class NumberPicker extends StatelessWidget {
  const NumberPicker({
    Key? key,
    required this.number,
    required this.phoneController,
  }) : super(key: key);

  final PhoneNumber number;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InternationalPhoneNumberInput(
            inputDecoration: InputDecoration(
              label: const Text("Phone Number"),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28.r),
                borderSide:
                    const BorderSide(width: 1, color: AppColors.mainColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28.r),
                borderSide:
                    const BorderSide(width: 1, color: AppColors.secondaryColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28.r),
                borderSide:
                    const BorderSide(width: 1, color: AppColors.secondaryColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28.r),
                borderSide:
                    const BorderSide(width: 1, color: AppColors.mainColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28.r),
                borderSide:
                    const BorderSide(width: 2, color: AppColors.mainColor),
              ),
            ),
            onInputChanged: (PhoneNumber number) {},
            validator: (val) {
              if (val!.isEmpty) {
                return "Your number is required";
              } else if (val.length < 10) {
                return "Invalid number";
              }
              return null;
            },
            autoValidateMode: AutovalidateMode.disabled,
            onInputValidated: (bool value) {},
            selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN,
                trailingSpace: false),
            ignoreBlank: false,
            selectorTextStyle: Theme.of(context).textTheme.subtitle1,
            initialValue: number,
            textFieldController: phoneController,
            formatInput: false,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputBorder: const OutlineInputBorder(),
            onSaved: (PhoneNumber number) {
              phoneController.text = number.phoneNumber!;
            },
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }
}
