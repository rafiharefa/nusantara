import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:nusantara/app/modules/auth_page/views/components/login.dart';
import 'package:nusantara/app/modules/auth_page/views/components/register.dart';

import '../../../data/vars.dart';
import '../controllers/auth_page_controller.dart';

class AuthPageView extends GetView<AuthPageController> {
  const AuthPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.ac_unit),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height - screenSize.height / 10,
          width: screenSize.width,
          child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Obx(() =>
                  controller.whatScreen.value == true ? Register() : Login())),
        ),
      ),
    );
  }
}
