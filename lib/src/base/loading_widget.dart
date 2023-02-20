import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shopsy/src/utils/app_images.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    this.isContainer = true,
  }) : super(key: key);
  final bool? isContainer;

  @override
  Widget build(BuildContext context) {
    return isContainer == true
        ? Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(5, 242, 242, 242),
            child: Container(
              height: 80.h,
              width: 80.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2, 5),
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10.r),
                    BoxShadow(
                        offset: const Offset(2, -5),
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 10.r)
                  ]),
              child: Center(
                child: Lottie.asset(
                  loadingLottie,
                  repeat: true,
                  fit: BoxFit.contain,
                  width: 50.w,
                  height: 50.h,
                ),
              ),
            ),
          )
        : SizedBox(
            height: 50.h,
            width: 50.w,
            child: Center(
              child: Lottie.asset(
                loadingLottie,
                repeat: true,
                fit: BoxFit.contain,
                width: 50.w,
                height: 50.h,
              ),
            ),
          );
  }
}
