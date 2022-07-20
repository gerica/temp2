import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/app/data/helpers/secure_local_storage.dart';
import 'package:radio_life/app/data/helpers/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RadioLifeGraphQLClient {
  RadioLifeGraphQLClient._();

  static Future<GraphQLClient> init(
    HttpLink httpLink,
    WebSocketLink webSocketLink,
    SecureLocalStorage secureStorage,
    SharedPreferences _sharedPreferences,
  ) async {
    final authLink = AuthLink(getToken: () async {
      final token = kIsWeb
          ? _sharedPreferences.getString(StorageKeys.token) ?? ''
          : await secureStorage.getData(key: StorageKeys.token);
      return '$token';
    });

    var link = authLink.concat(httpLink);
    link = Link.split((request) => request.isSubscription, webSocketLink, link);
    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.networkOnly),
        mutate: Policies(fetch: FetchPolicy.networkOnly),
        subscribe: Policies(fetch: FetchPolicy.networkOnly),
      ),
    );
  }
}
