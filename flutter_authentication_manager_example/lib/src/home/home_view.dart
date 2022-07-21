import 'package:flutter/material.dart';
import 'package:flutter_authentication_manager_example/core/auth_manager.dart';
import 'package:flutter_authentication_manager_example/core/cache_manager.dart';
import 'package:flutter_authentication_manager_example/core/model/user_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  String token = '';

  late UserModel? userModel;

  Future<void> getTokenCache() async {
    token = await getToken() ?? '';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    userModel = context.read<AuthenticationManager>().model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${userModel?.name}')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(userModel?.imageUrl ?? ''),
            maxRadius: 120.0,
          ),
        ),
      ),
    );
  }
}
