import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ropstam_flutter_task/utilities/pref_provider.dart';
import 'package:ropstam_flutter_task/views/auth/login_vm.dart';
import 'package:ropstam_flutter_task/views/home/home_vm.dart';
import 'package:ropstam_flutter_task/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'data/route/route_setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginVm()),
          ChangeNotifierProvider(create: (_) => HomeVm()),
          ChangeNotifierProvider(create: (_) => PreferencesProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Splash.routeName,
          onGenerateRoute: (settings) => generateRoute(settings),
          builder: EasyLoading.init(),
        ));
  }
}
