import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara/app/data/vars.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePageView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Gvar.user['name'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          Text(Gvar.user['email']),
          SizedBox(
            height: 50,
          ),
          FilledButton(
              onPressed: () {
                controller.logout();
              },
              child: Text('Log Out')),
        ],
      )),
    );
  }
}
