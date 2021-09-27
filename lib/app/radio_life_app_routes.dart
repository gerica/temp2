import 'package:get/get.dart';
import 'package:radio_life/app/pages/forgot_password/bindings/forgot_password_binding.dart';
import 'package:radio_life/app/pages/forgot_password/forgot_password_page.dart';
import 'package:radio_life/app/pages/forgot_password/pages/change_password_page.dart';
import 'package:radio_life/app/pages/home/bindings/home_bindings.dart';
import 'package:radio_life/app/pages/home/home_page.dart';
import 'package:radio_life/app/pages/my_devices/pages/auto_scan_page/auto_scan_page.dart';
import 'package:radio_life/app/pages/my_devices/pages/auto_scan_page/bindings/auto_scan_binding.dart';
import 'package:radio_life/app/pages/my_devices/pages/buy_credits_page/bindings/buy_credits_bindings.dart';
import 'package:radio_life/app/pages/my_devices/pages/buy_credits_page/buy_credits_page.dart';
import 'package:radio_life/app/pages/my_devices/pages/configure_wifi/bindings/configure_wifi_binding.dart';
import 'package:radio_life/app/pages/my_devices/pages/configure_wifi/configure_wifi_page.dart';
import 'package:radio_life/app/pages/my_devices/pages/credits_transaction_success/bindings/credits_transaction_success.dart';
import 'package:radio_life/app/pages/my_devices/pages/credits_transaction_success/credit_transaction_success_page.dart';
import 'package:radio_life/app/pages/my_devices/pages/my_device_detail/bindings/my_device_detail_binding.dart';
import 'package:radio_life/app/pages/my_devices/pages/my_device_detail/my_device_detail_page.dart';
import 'package:radio_life/app/pages/qr_code_viewer/qr_code_viewer_page.dart';
import 'package:radio_life/app/pages/sign_in/bindings/sign_in_bindings.dart';
import 'package:radio_life/app/pages/sign_in/pages/create_password/bindings/create_password_binding.dart';
import 'package:radio_life/app/pages/sign_in/pages/create_password/create_password_page.dart';
import 'package:radio_life/app/pages/sign_in/sign_in_page.dart';
import 'package:radio_life/app/pages/sign_up/bindings/sign_up_bindings.dart';
import 'package:radio_life/app/pages/sign_up/sign_up_page.dart';

import 'pages/forgot_password/pages/bindings/change_password_binding.dart';
import 'pages/my_devices/bindings/my_devices_binding.dart';
import 'pages/my_devices/my_devices_page.dart';
import 'pages/my_devices/pages/add_new_device/add_new_device_page.dart';
import 'pages/my_devices/pages/add_new_device/bindings/add_new_device_binding.dart';
import 'pages/products/bindings/products_binding.dart';
import 'pages/products/pages/product_details/bindings/product_details_binding.dart';
import 'pages/products/pages/product_details/product_details_page.dart';
import 'pages/products/products_page.dart';
import 'pages/profile/bindings/profile_bindings.dart';
import 'pages/profile/pages/update_password/bindings/update_password_bindings.dart';
import 'pages/profile/pages/update_password/update_password_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/reports/bindings/reports_binding.dart';
import 'pages/reports/pages/report_details/bindings/report_details_binding.dart';
import 'pages/reports/pages/report_details/report_details_page.dart';
import 'pages/reports/reports_page.dart';
import 'pages/support/bindings/support_binding.dart';
import 'pages/support/support_page.dart';

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
  static const updatePassword = '$profile/update-password';
  static const addNewDevice = '$myDevices/newDevice';
  static const qrCodeViewer = 'qr-code-viewer';
  static const changePasswordPage = '$forgotPassword/change-password';
  static const myDeviceDetail = '$myDevices/my-device-detail';
  static const buyCreditsPage = '$myDeviceDetail/buy-credits';
  static const creditsTransactionSuccess =
      '$buyCreditsPage/credits-transaction-success';
  static const autoScanPage = '$addNewDevice/auto-scan-page';
  static const configureWiFi = '$autoScanPage/configure-wifi';
  static const createPassword = '$signIn/create-password';
}

mixin RadioLifeAppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.signUp,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.createPassword,
      page: () => CreatePasswordPage(),
      binding: CreatePasswordBinding(),
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
      name: Routes.changePasswordPage,
      page: () => ChangePasswordPage(),
      binding: ChangePasswordBinding(),
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
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.myDevices,
        page: () => MyDevicesPage(),
        binding: MyDevicesBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.reports,
        page: () => ReportsPage(),
        binding: ReportsBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.support,
        page: () => SupportPage(),
        binding: SupportBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.productDetails,
        page: () => ProductDetailsPage(),
        binding: ProductDetailsBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.reportDetails,
        page: () => ReportDetailsPage(),
        binding: ReportDetailsBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.profile,
        page: () => ProfilePage(),
        binding: ProfileBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.updatePassword,
        page: () => UpdatePasswordPage(),
        binding: UpdatePasswordBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.addNewDevice,
        page: () => AddNewDevicePage(),
        binding: AddNewDeviceBinding(),
        transition: Transition.fadeIn),
    GetPage<String>(
        name: Routes.qrCodeViewer,
        page: () => const QRCodeViewerPage(),
        transition: Transition.fadeIn),
    GetPage<String>(
        name: Routes.myDeviceDetail,
        page: () => MyDeviceDetailPage(),
        binding: MyDeviceDetailBinding(),
        transition: Transition.fadeIn),
    GetPage<String>(
        name: Routes.buyCreditsPage,
        page: () => BuyCreditsPage(),
        binding: BuyCreditsBinding(),
        transition: Transition.fadeIn),
    GetPage<String>(
        name: Routes.creditsTransactionSuccess,
        page: () => CreditTransactionSuccessPage(),
        binding: CreditTransactionSuccessBinding(),
        transition: Transition.fadeIn),
    GetPage<String>(
        name: Routes.autoScanPage,
        page: () => AutoScanPage(),
        binding: AutoScanBinding(),
        transition: Transition.fadeIn),
    GetPage<String>(
        name: Routes.configureWiFi,
        page: () => ConfigureWiFiPage(),
        binding: ConfigureWiFiBinding(),
        transition: Transition.fadeIn)
  ];
}
