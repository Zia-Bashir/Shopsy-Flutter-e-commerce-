import 'package:shopsy/src/utils/app_images.dart';
import 'package:shopsy/src/utils/app_text.dart';

class OnboardingPageModel {
  final String subTitle;
  final String imgURL;
  OnboardingPageModel(this.subTitle, this.imgURL);
}

List<OnboardingPageModel> onboardingModel = [
  OnboardingPageModel(tOnBoardingSubTitle1, onboardingImage1),
  OnboardingPageModel(tOnBoardingSubTitle2, onboardingImage2),
  OnboardingPageModel(tOnBoardingSubTitle3, onboardingImage3),
];
