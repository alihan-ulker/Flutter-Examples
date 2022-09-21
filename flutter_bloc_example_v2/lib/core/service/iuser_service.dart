import 'package:flutter_bloc_example_v2/core/model/regres_model.dart';
import 'package:vexana/vexana.dart';

abstract class IUserService {
  final INetworkManager networkManager;

  IUserService({required this.networkManager});

  Future<List<Data>> fetchUserData({int page = 0});
}
