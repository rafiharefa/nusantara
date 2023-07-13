import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nusantara/app/data/vars.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxList books = [].obs;

  Future<void> fetchUser() async {
    try {
      final response = await Dio().get(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/user',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": 'Bearer ${Gvar.token.value}'
          }));

      Gvar.user.value = response.data;
      print(Gvar.user.toString());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> fetchBooks() async {
    try {
      final response = await Dio().get(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${Gvar.token.value}"
          }));

      if (response.statusCode == 200) {
        books.value = response.data['data'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    await fetchBooks();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
