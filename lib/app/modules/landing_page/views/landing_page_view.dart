import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara/app/data/vars.dart';
import 'package:nusantara/app/modules/auth_page/controllers/auth_page_controller.dart';

import '../controllers/landing_page_controller.dart';

class LandingPageView extends GetView<LandingPageController> {
  const LandingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'TITLE',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.ac_unit_outlined,
                  size: 150,
                ),
                Column(
                  children: [
                    FilledButton(
                      onPressed: () {
                        Get.put(AuthPageController()).whatScreen.value = false;

                        Get.toNamed('/auth-page');
                      },
                      child: Text('Login'),
                      style: FilledButton.styleFrom(
                          minimumSize: Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FilledButton(
                      onPressed: () {
                        Get.put(AuthPageController()).whatScreen.value = true;
                        Get.toNamed('/auth-page');
                      },
                      child: Text('Register'),
                      style: FilledButton.styleFrom(
                          minimumSize: Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
