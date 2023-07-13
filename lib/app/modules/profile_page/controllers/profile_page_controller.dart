import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/vars.dart';

class ProfilePageController extends GetxController {
  Future<void> logout() async {
    try {
      final response = await Dio().delete(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/user/logout',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${Gvar.token.value}"
          }));
      if (response.statusCode == 200) {
        Get.defaultDialog(content: Text(response.data['message']));
        Gvar.token.value = '';
        Get.offAllNamed('/landing-page');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
