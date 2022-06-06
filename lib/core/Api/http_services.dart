import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as prefix;
import 'package:http/http.dart' as http;
import 'package:infoskies/core/Api/dataModel.dart';


class HttpServices{
    Future<List<DataModel?>?> getReq() async {
    const url =
        "https://api.unsplash.com/photos/?client_id=qNaBu5Vno4FXGV5DUWu68mf8InFn6OkMfOrNrO5Gm2s";
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.get(
        pathUrl,
      );
      log("dataaaaaaaa${response.body}");
      log("${response.statusCode}");
      String responseString = response.body;

      if (responseString.contains("error")) {
        prefix.Get.snackbar("HR creation failed", "HR Already exist");
      } else {
        if (response.statusCode == 200) {
          String responseString = response.body;
          log("${response.statusCode}");
          return dataModelFromJson(responseString);
        }
      }

    } on SocketException {
      log("prob");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: Colors.red,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } 
  }

  

}