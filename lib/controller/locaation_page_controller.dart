import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:infoskies/core/constantwidgets/buttonwidget.dart';
import 'package:infoskies/core/constantwidgets/txtbox.dart';

import '../core/constantwidgets/textwidget.dart';

class LocationScreenController extends GetxController {
  TextEditingController locationController = TextEditingController();
  String locationMessage = '';

  getCurrentLocation(BuildContext context) async {
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      locationMessage =
          "latitude,longitude - ${position.latitude} , ${position.longitude}";
      update();
    } on Exception {
      Get.snackbar("Error", "Permission Denied");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const TextWidget(txt: "Enter your Location"),
              content: TxtField(
                  controller: locationController, hint: "Your Location"),
              actions: [
                ButtonWidget(
                    txt: "Ok",
                    ontap: () {
                      Navigator.of(context).pop();
                      locationMessage = locationController.text.toUpperCase();
                      update();
                    })
              ],
            );
          });
    }
  }
}
