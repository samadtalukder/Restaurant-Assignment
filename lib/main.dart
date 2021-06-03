import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restarurent_assignment/utils/color_util.dart';
import 'package:restarurent_assignment/view/login/login_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorUtil.blue_900,
    statusBarIconBrightness: Brightness.light,
    // Only honored in Android M and above
    statusBarBrightness: Brightness.light, // Only honored in iOS
  ));
  WidgetsFlutterBinding.ensureInitialized();

  runApp(RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Restaurant Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}


