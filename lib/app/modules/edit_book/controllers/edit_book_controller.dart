import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara/app/data/vars.dart';

import '../../home/controllers/home_controller.dart';

class EditBookController extends GetxController {
  //TODO: Implement EditBookController

  RxMap bookDetail = {}.obs;

  Future<void> fetchBook() async{
    final response = await Dio().get('https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/${Get.arguments}',
    options: Options(headers: {"Accept": "application/json", "Authorization": "Bearer ${Gvar.token.value}"}));

    if(response.statusCode == 200){
      print(response.data);
      bookDetail.value = response.data;
    }
  }
  
  Future<void> deleteBook() async{
    try{
      final response = await Dio().delete('https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/${Get.arguments}',
      options: Options(
        headers: {
          "Accept": "application/json", "Authorization": "Bearer ${Gvar.token.value}"
        }
      ));

      if(response.statusCode == 200){
        Get.back();
        Get.defaultDialog(content: Text('Book Successfully deleted!'));

        await Get.put(HomeController()).fetchBooks();

      }
    }catch(e){
      Get.defaultDialog(content: Text('error: $e'));

    }
  }

  Future<void> editBook(
      String isbn,
      String title,
      String subtitle,
      String author,
      String publisher,
      String description,
      String website,
      ) async{
   try{
     final response = await Dio().put('https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/${Get.arguments}/edit',options:
     Options(headers: {
       "Accept": "application/json",
       "Authorization": "Bearer ${Gvar.token.value}"
     }), data: {

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
       Get.defaultDialog(content: Text('Book successfully edited!'));
       await Get.put(HomeController()).fetchBooks();


     }
   }catch(e){
     Get.defaultDialog(content: Text('error: $e'));

   }
  }
}
