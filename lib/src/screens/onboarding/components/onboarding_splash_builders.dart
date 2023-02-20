import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/models/onboarding_page_model.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class OnboardingPageBuilder extends StatelessWidget {
  const OnboardingPageBuilder({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              MyTextWidget(
                title: tTitle,
                style: Theme.of(context).textTheme.headline1!,
                align: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              index == 0
                  ? RichText(
                      text: TextSpan(
                          text: onboardingModel[index].subTitle,
                          style: Theme.of(context).textTheme.subtitle1,
                          children: [
                          TextSpan(
                              text: "SHOPSY, ".toUpperCase(),
                              style: Theme.of(context).textTheme.bodyText1,
                              children: [
                                TextSpan(
                                    text: "Let’s shop!",
                                    style:
                                        Theme.of(context).textTheme.subtitle1)
                              ])
                        ]))
                  : MyTextWidget(
                      title: onboardingModel[index].subTitle,
                      style: Theme.of(context).textTheme.subtitle1!,
                      align: TextAlign.center,
                    ),
            ],
          ),
          Image.asset(onboardingModel[index].imgURL),
        ],
      ),
    );
  }
}
