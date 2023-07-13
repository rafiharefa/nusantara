import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_page_controller.dart';

class BookPageView extends GetView<BookPageController> {
  const BookPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
