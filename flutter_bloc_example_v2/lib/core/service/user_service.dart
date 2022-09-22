import 'package:flutter_bloc_example_v2/core/model/regres_model.dart';
import 'package:flutter_bloc_example_v2/core/service/iuser_service.dart';
import 'package:flutter_bloc_example_v2/core/utility/network_query.dart';
import 'package:flutter_bloc_example_v2/core/utility/network_route.dart';
import 'package:vexana/vexana.dart';

class UserService extends IUserService {
  UserService(INetworkManager manager) : super(networkManager: manager);

  @override
  Future<List<Data>> fetchUserData({int page = 0}) async {
    final response = await networkManager.send<RegresModel, RegresModel>(
      NetworkRoute.USERS.rawValue,
      parseModel: RegresModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries([NetworkQuery.PAGE.pageQuery(page)]),
    );

    final reqResModel = response.data;

    if (reqResModel != null) {
      final dataList = reqResModel.data;
      if (dataList != null) {
        return dataList;
      }
    }

    return [];
  }
}
