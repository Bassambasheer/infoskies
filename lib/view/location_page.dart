import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infoskies/controller/locaation_page_controller.dart';
import 'package:infoskies/core/constantwidgets/textwidget.dart';
import 'package:infoskies/theme/theme.dart';
import 'package:infoskies/view/maps_page.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocationScreenController());
    return GetBuilder<LocationScreenController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const MapScreen()));
                },
                child: const TextWidget(
                  txt: "Next screen",
                  clr: black,
                ))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_pin,
                size: 70,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.getCurrentLocation(context);
                  },
                  child: const TextWidget(txt: "Current Location")),
              const SizedBox(
                height: 100,
              ),
              ctrl.locationMessage.isEmpty
                  ? const SizedBox()
                  : TextWidget(
                      txt:
                          "Your Current Location is \n ${ctrl.locationMessage}",
                      align: TextAlign.center,
                    ),
            ],
          ),
        ),
      );
    });
  }
}
