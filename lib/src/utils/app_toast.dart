import 'package:flutter/Material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(BuildContext context, Widget toastWidget) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = toastWidget;
  fToast.showToast(
    child: toast,
    toastDuration: const Duration(seconds: 2),
    gravity: ToastGravity.BOTTOM,
  );
}
