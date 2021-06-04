import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restarurent_assignment/services/api_service.dart';
import 'package:restarurent_assignment/utils/color_util.dart';
import 'package:restarurent_assignment/utils/constants.dart';
import 'package:restarurent_assignment/utils/shared_pref_util.dart';
import 'package:restarurent_assignment/view/menu/menu_page.dart';

class LoginController extends GetxController {

  void loginRequest(
    String email,
    String password,
    bool isTermsAccepted,
    String restaurant,
  ) async {
    try {
      var login = await APIService.fetchLogin(
        email,
        password,
        isTermsAccepted,
        restaurant,
      );

      /* Check login response is Null or Not-Null*/
      if (login != null) {
        /* Pass access token to method */
        saveTokenWithNavigateToMenuPage(login.access);
      } else {
        Get.snackbar(
          "Invalid email or password",
          "",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 1),
          backgroundColor: Colors.green,
          colorText: ColorUtil.white,
          margin: EdgeInsets.all(10.0),
        );
      }
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }

  void saveTokenWithNavigateToMenuPage(String access) {
    SharedPrefUtil.setData(Constants.Token, access);

    Get.snackbar(
      'Login Success',
      '',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
      backgroundColor: Colors.green,
      colorText: ColorUtil.white,
      margin: EdgeInsets.all(10.0),
    );
    /* While login is success navigate to MenuPage */
    Get.off(MenuPage());
    /*Get.offAll(
      MenuPage(),
    );*/
  }
}
