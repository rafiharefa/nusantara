import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:nusantara/app/data/vars.dart';

class AuthPageController extends GetxController {
  RxBool whatScreen = false.obs;

  RxString password = ''.obs;
  RxString token = ''.obs;

  final loginFormKey = GlobalKey<FormBuilderState>();
  final registerFormKey = GlobalKey<FormBuilderState>();
  final confirmationKey = GlobalKey<FormBuilderFieldState>();
  final passwordKey = GlobalKey<FormBuilderFieldState>();

  void toggleScreen() {
    whatScreen.value = !whatScreen.value;
  }

  Future<void> createUser(
      String name, String email, String password, String confirmation) async {
    try {
      final response = await Dio().post(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/register',
          data: {
            "email": email,
            "name": name,
            "password": password,
            "password_confirmation": confirmation
          },
          options: Options(headers: {"Accept": "application/json"}));
      if (response.statusCode == 200) {
        Get.defaultDialog(content: Text('Create Account Successfull'));
      }
      whatScreen.value = false;
    } catch (e) {
      print(e.toString());
      Get.defaultDialog(content: Text('Email is already registered'));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await Dio().post(
          "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/login",
          data: {"email": email, "password": password},
          options: Options(headers: {"Accept": "application/json"}));

      if (response.statusCode == 200) {
        Get.defaultDialog(content: Text('Login Successfull'));
        token.value = response.data['token'];
        Get.offAllNamed('/home');
      }
    } catch (e) {
      print(e.toString());
      Get.defaultDialog(content: Text('Wrong email or password!'));
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    ever(token, (_) {
      Gvar.token.value = token.value;
    });
    super.onReady();
  }
}
