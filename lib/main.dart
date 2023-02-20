import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/firebase_options.dart';
import 'package:shopsy/src/routes/app_routes.dart';
import 'package:shopsy/src/services/storage_services.dart';
import 'package:shopsy/src/theme/theme.dart';

import './src/helper/dependicies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //? --- Getx Dependecy Injection ---
  dep.initState();

  //* --- Storage Services ---
  StorageServices.to.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopsy',
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          themeMode: ThemeMode.light,
          home: child,
          getPages: Approutes.routes,
        );
      },
      //child: const HomeScreen(),
    );
  }
}
