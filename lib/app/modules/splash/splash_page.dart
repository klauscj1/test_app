import 'package:app_crud/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            'CRUD APP',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
