import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../config/app_color.dart';

void showToast({required BuildContext context, Color? colors, String? msg, int? duration}) {
  FToast fToast = FToast();
  fToast.init(context);
  Container toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: colors ?? AppColor.black,
    ),
    child: Text(
      msg ?? "",
      style: const TextStyle(
        fontFamily: "Euclid Circular A",
        color: Colors.white,
        fontSize: 12,
      ),
      textAlign: TextAlign.center,
    ),
  );
  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: Duration(seconds: duration ?? 4),
  );
}
