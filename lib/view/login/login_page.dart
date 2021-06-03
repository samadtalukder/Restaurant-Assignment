import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restarurent_assignment/controller/login_controller.dart';
import 'package:restarurent_assignment/utils/constants.dart';
import 'package:restarurent_assignment/utils/color_util.dart';
import 'package:restarurent_assignment/utils/text_util.dart';
import 'package:restarurent_assignment/utils/validator.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              ColorUtil.blue_900,
              ColorUtil.blue_800,
              ColorUtil.blue_400
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextUtil(
                text: Constants.welcome,
                color: ColorUtil.white,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorUtil.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorUtil.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _emailTextController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    fillColor: ColorUtil.grey_200,
                                    filled: true,
                                    hintText: Constants.email,
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: ColorUtil.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                  validator: (String value) {
                                    return Validator.validateEmail(value);
                                  },
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: _passwordTextController,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey[200],
                                    filled: true,
                                    hintText: Constants.password,
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return Constants.password_required;
                                    } else if (value.trim().length < 6) {
                                      return Constants
                                          .password_required_message;
                                    } else
                                      return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () async {
                            /* Keyboard Hide Function */
                            FocusManager.instance.primaryFocus.unfocus();

                            /* While you press login onTap then check your form Validation */
                            if (_formKey.currentState.validate()) {
                              /* If your form validation is ok then can be send your data on request to server */
                              loginController.loginRequest(
                                _emailTextController.text.trim().toString(),
                                _passwordTextController.text.trim().toString(),
                                true,
                                Constants.restaurant,
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorUtil.orange_900,
                            ),
                            child: Center(
                              child: TextUtil(
                                text: Constants.login,
                                color: ColorUtil.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
