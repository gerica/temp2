import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/helpers/secure_local_storage.dart';
import 'package:radio_life/core/data/interceptors/radio_life_interceptor.dart';
import 'package:radio_life/core/data/network/dio_client.dart';
import 'package:radio_life/core/data/network/radio_life_graphql_client.dart';
import 'package:radio_life/flavors/flavor_values.dart';

// Use this module to inject your third-party dependencies like [FirebaseAuth]
// E.g. FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

@module
abstract class RemoteModule {
  Dio provideDio() {
    final dio = Dio();
    dio.options.connectTimeout = 10000;
    dio.options.sendTimeout = 20000;
    dio.options.receiveTimeout = 10000;
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

  @preResolve
  Future<GraphQLClient> provideGraphQLClient(
          HttpLink httpLink, WebSocketLink webSocketLink, SecureLocalStorage secureStorage) =>
      RadioLifeGraphQLClient.init(httpLink, webSocketLink, secureStorage);

  @singleton
  InterceptorsWrapper provideInterceptor(
          Dio dio, @Named('language') String language, FlutterSecureStorage flutterSecureStorage) =>
      RadioLifeInterceptor.init(dio, language, flutterSecureStorage);

  DioClient provideApi(Dio dio, InterceptorsWrapper interceptor) {
    dio.interceptors.add(interceptor);
    return DioClient(dio);
  }
}
