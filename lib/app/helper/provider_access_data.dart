import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/app/data/helpers/secure_local_storage.dart';
import 'package:radio_life/app/data/interceptors/radio_life_interceptor.dart';
import 'package:radio_life/app/data/network/dio_client.dart';
import 'package:radio_life/app/data/network/radio_life_graphql_client.dart';
import 'package:radio_life/flavors/flavor_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderAccessData {
  late final GraphQLClient graphQLClient;
  late final SharedPreferences sharedPreferences;
  static final ProviderAccessData _singleton = ProviderAccessData._internal();

  factory ProviderAccessData() {
    return _singleton;
  }

  ProviderAccessData._internal();

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await provideGraphQLClient();
  }

  Dio provideDio() {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(milliseconds: 1000);
    dio.options.sendTimeout = const Duration(milliseconds: 2000);
    dio.options.receiveTimeout = const Duration(milliseconds: 1000);
    dio.options.baseUrl = FlavorConfig.instance.values.baseUrl;
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    return dio;
  }

  HttpLink provideHttpLink() => HttpLink(FlavorConfig.instance.values.baseUrl);

  WebSocketLink provideWebSocketLink() => WebSocketLink(
        FlavorConfig.instance.values.baseWebSocketUrl,
        config: const SocketClientConfig(autoReconnect: true),
      );

  Future<void> provideGraphQLClient() async {
    graphQLClient = await RadioLifeGraphQLClient.init(
        provideHttpLink(), provideWebSocketLink(), SecureLocalStorage(), sharedPreferences);
  }

  InterceptorsWrapper provideInterceptor(Dio dio, String language, FlutterSecureStorage flutterSecureStorage) =>
      RadioLifeInterceptor.init(dio, language, SecureLocalStorage().storage);

  DioClient provideApi(Dio dio, InterceptorsWrapper interceptor) {
    dio.interceptors.add(interceptor);
    return DioClient(dio);
  }
}
