import 'package:flutter/material.dart';
import 'package:get/get.dart';

void bottomSheetGetx(Widget child) {
  Get.bottomSheet(
    backgroundColor: Colors.white,
    SizedBox(
      height: 300,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: child,
      ),
    ),
  );
}
