import 'package:flutter_bloc_example_v2/core/utility/network_route.dart';
import 'package:vexana/vexana.dart';

class ProjectConstants {
  static ProjectConstants? _instace;
  static ProjectConstants get instance {
    _instace ??= ProjectConstants._init();
    return _instace!;
  }

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: NetworkRoute.BASE_URL.rawValue),
  );
  ProjectConstants._init();
}
