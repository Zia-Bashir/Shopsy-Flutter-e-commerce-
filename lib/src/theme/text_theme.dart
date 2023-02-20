import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopsy/src/utils/app_colors.dart';

class AppTextTheme {
  //* -- Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.mulish(
        fontSize: 36.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.mainColor),
    headline2: GoogleFonts.mulish(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
    ),
    headline3: GoogleFonts.mulish(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline4: GoogleFonts.mulish(fontSize: 20.sp, fontWeight: FontWeight.w600),
    headline5: GoogleFonts.mulish(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textHeadColor),
    headline6: GoogleFonts.mulish(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.secondaryColor,
    ),
    subtitle1: GoogleFonts.mulish(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryColor),
    subtitle2: GoogleFonts.mulish(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: GoogleFonts.mulish(
        fontSize: 17.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.secondaryColor),
    bodyText2: GoogleFonts.mulish(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.mainColor),
    button: GoogleFonts.mulish(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    caption: GoogleFonts.mulish(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    overline: GoogleFonts.mulish(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  );
  //* -- Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    headline2: GoogleFonts.montserrat(
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    headline3: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    headline4: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    headline5: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    bodyText1: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodyText2: GoogleFonts.poppins(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  );
}
