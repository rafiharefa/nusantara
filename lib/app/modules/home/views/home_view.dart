import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara/app/data/vars.dart';
import 'package:nusantara/app/modules/book_page/views/book_page_view.dart';
import 'package:nusantara/app/modules/create_book/views/create_book_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateBookView());
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Books'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/profile-page');
              },
              icon: Icon(Icons.person)),
        ],
      ),
      body: FutureBuilder(
          future: controller.fetchUser(),
          builder: (context, snapshot) {
            return Obx(
              () => ListView.builder(
                itemCount: controller.books.length,
                itemBuilder: (context, index) {
                  final book = controller.books[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: () => Get.toNamed('/edit-book', arguments: book['id']),
                        title: Text(book['title']),
                        subtitle: book['description'] != null ? Text(book['description']) : Text(''),
                      ),
                      Divider()
                    ],
                  );
                },
              ),
            );
          }),
    );
  }
}
