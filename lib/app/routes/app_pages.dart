import 'package:get/get.dart';

import '../modules/auth_page/bindings/auth_page_binding.dart';
import '../modules/auth_page/views/auth_page_view.dart';
import '../modules/book_page/bindings/book_page_binding.dart';
import '../modules/book_page/views/book_page_view.dart';
import '../modules/create_book/bindings/create_book_binding.dart';
import '../modules/create_book/views/create_book_view.dart';
import '../modules/edit_book/bindings/edit_book_binding.dart';
import '../modules/edit_book/views/edit_book_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/landing_page/bindings/landing_page_binding.dart';
import '../modules/landing_page/views/landing_page_view.dart';
import '../modules/profile_page/bindings/profile_page_binding.dart';
import '../modules/profile_page/views/profile_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANDING_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LANDING_PAGE,
      page: () => const LandingPageView(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_PAGE,
      page: () => const AuthPageView(),
      binding: AuthPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_PAGE,
      page: () => const BookPageView(),
      binding: BookPageBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_BOOK,
      page: () => const CreateBookView(),
      binding: CreateBookBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_BOOK,
      page: () => const EditBookView(),
      binding: EditBookBinding(),
    ),
  ];
}
