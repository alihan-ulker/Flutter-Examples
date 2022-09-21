import 'package:flutter_bloc_example_v2/core/exception/network_route_exception.dart';

enum NetworkRoute { BASE_URL, USERS }

extension NetworkRouteExtension on NetworkRoute {
  String get rawValue {
    switch (this) {
      case NetworkRoute.BASE_URL:
        return 'https://reqres.in/api';
      case NetworkRoute.USERS:
        return '/users';
      default:
        throw NetworkRouteException();
    }
  }
}
