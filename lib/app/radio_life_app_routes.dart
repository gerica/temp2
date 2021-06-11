import 'package:get/get.dart';
import 'package:radio_life/app/pages/forgot_password/bindings/forgot_password_binding.dart';
import 'package:radio_life/app/pages/forgot_password/forgot_password_page.dart';
import 'package:radio_life/app/pages/home/bindings/home_bindings.dart';
import 'package:radio_life/app/pages/home/home_page.dart';
import 'package:radio_life/app/pages/home/pages/app/my_devices/bindings/my_devices_binding.dart';
import 'package:radio_life/app/pages/home/pages/app/my_devices/my_devices_page.dart';
import 'package:radio_life/app/pages/home/pages/app/products/bindings/products_binding.dart';
import 'package:radio_life/app/pages/home/pages/app/products/pages/product_details/bindings/product_details_binding.dart';
import 'package:radio_life/app/pages/home/pages/app/products/products_page.dart';
import 'package:radio_life/app/pages/home/pages/profile/profile_page.dart';
import 'package:radio_life/app/pages/home/pages/reports/pages/report_details/bindings/report_details_binding.dart';
import 'package:radio_life/app/pages/home/pages/reports/pages/report_details/report_details_page.dart';
import 'package:radio_life/app/pages/sign_in/bindings/sign_in_bindings.dart';
import 'package:radio_life/app/pages/sign_in/sign_in_page.dart';
import 'package:radio_life/app/pages/sign_up/bindings/sign_up_bindings.dart';
import 'package:radio_life/app/pages/sign_up/sign_up_page.dart';

import 'pages/home/pages/app/products/pages/product_details/product_details_page.dart';
import 'pages/home/pages/profile/bindings/profile_bindings.dart';
import 'pages/home/pages/reports/bindings/reports_binding.dart';
import 'pages/home/pages/reports/reports_page.dart';
import 'pages/home/pages/support/bindings/support_binding.dart';
import 'pages/home/pages/support/support_page.dart';

abstract class Routes {
  static String initial = '/';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const home = '/home';
  static const account = '/account';
  static const forgotPassword = '/forgot-password';
  static const products = '$home/products';
  static const myDevices = '$home/my_devices';
  static const reports = '$home/reports';
  static const support = '$home/support';
  static const productDetails = '$products/product-details';
  static const reportDetails = '$reports/reports-details';
  static const profile = '$home/profile';
}

mixin RadioLifeAppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.signUp,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.products,
      page: () => ProductsPage(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: Routes.myDevices,
      page: () => MyDevicesPage(),
      binding: MyDevicesBinding(),
    ),
    GetPage(
      name: Routes.reports,
      page: () => ReportsPage(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: Routes.support,
      page: () => SupportPage(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: Routes.productDetails,
      page: () => ProductDetailsPage(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: Routes.reportDetails,
      page: () => ReportDetailsPage(),
      binding: ReportDetailsBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    )
  ];
}
