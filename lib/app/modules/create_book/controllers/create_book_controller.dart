import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:nusantara/app/data/vars.dart';
import 'package:nusantara/app/modules/home/controllers/home_controller.dart';

class CreateBookController extends GetxController {



  Future<void> createBook(
      String isbn,
      String title,
      String subtitle,
      String author,
      String publisher,
      String description,
      String website,
      ) async {



    try {
      final response = await Dio().post(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/add',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${Gvar.token.value}"
          }),
          data: {
            "isbn": isbn,
            "title": title,
            "subtitle": subtitle,
            "author": author,
            "publisher": publisher,
            "description": description,
            "website": website
          });

      if (response.statusCode == 200) {
        print(response.data);
        Get.back();
        Get.defaultDialog(content: Text('Book successfully added!'));
        await Get.put(HomeController()).fetchBooks();


      }
    } catch (e) {
      Get.defaultDialog(content: Text('Error!'));

      throw Exception(e);
    }
  }
}
