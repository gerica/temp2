
import 'package:get/get.dart';
import 'package:radio_life/app/pages/forgot_password/bindings/forgot_password_binding.dart';
import 'package:radio_life/app/pages/forgot_password/forgot_password_page.dart';
import 'package:radio_life/app/pages/home/bindings/home_bindings.dart';
import 'package:radio_life/app/pages/home/home_page.dart';
import 'package:radio_life/app/pages/sign_in/bindings/sign_in_bindings.dart';
import 'package:radio_life/app/pages/sign_in/sign_in_page.dart';
import 'package:radio_life/app/pages/sign_up/bindings/sign_up_bindings.dart';
import 'package:radio_life/app/pages/sign_up/sign_up_page.dart';

abstract class Routes {
  static String initial = '/';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const home = '/home';
  static const account = '/account';
  static const forgotPassword = '/forgot-password';
}

mixin RadioLifeAppRoutes {
  static List<GetPage> routes = [
    GetPage(
        name: Routes.signUp,
        page: () => SignUpPage(),
        binding: SignUpBinding()
    ),
    GetPage(
      name: Routes.signIn,
      page: () => SignInPage(),
      binding: SignInBinding()
    ),
    GetPage(
        name: Routes.forgotPassword,
        page: () => ForgotPasswordPage(),
        binding: ForgotPasswordBinding()
    ),
    GetPage(
        name: Routes.home,
        page: () => HomePage(),
        binding: HomeBinding()
    )
  ];
}
