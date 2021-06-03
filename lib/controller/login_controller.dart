import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restarurent_assignment/services/api_service.dart';
import 'package:restarurent_assignment/view/menu/menu_page.dart';

class LoginController extends GetxController {

  void loginRequest(String email, String password, bool isTermsAccepted, String restaurant,) async {
    try {
      /* From Data UI */
      var login = await APIService.fetchLogin(email, password, isTermsAccepted, restaurant,);

      /* Check login response is Null or Not-Null*/
      if (login != null) {
        Get.offAll(
          MenuPage(),
        );
      } else {
        Get.snackbar(
          "Error while Login in ",
          "$login",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }
}
