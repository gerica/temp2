import 'package:graphql/client.dart';
import 'package:radio_life/app/helper/provider_access_data.dart';

abstract class DataSourceBase {
  GraphQLClient get graphQLClient {
    return ProviderAccessData().graphQLClient;
  }
}
