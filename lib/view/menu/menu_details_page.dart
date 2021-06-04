import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restarurent_assignment/network/api_url.dart';
import 'package:restarurent_assignment/utils/color_util.dart';
import 'package:restarurent_assignment/utils/constants.dart';
import 'package:restarurent_assignment/utils/network_image_util.dart';
import 'package:restarurent_assignment/utils/text_util.dart';

class MenuDetailsPage extends StatefulWidget {
  final String title, image, price, ingredientLists;

  const MenuDetailsPage(
      {Key key, this.title, this.image, this.price, this.ingredientLists})
      : super(key: key);

  @override
  _MenuDetailsPageState createState() => _MenuDetailsPageState();
}

class _MenuDetailsPageState extends State<MenuDetailsPage> {
  var getArguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorUtil.white),
        backgroundColor: ColorUtil.blue_800,
        elevation: 0,
        title: TextUtil(
          text: Constants.menu_details,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: NetworkImageUtil(
                  APIUrl.baseUrl + widget.image,
                  width: double.infinity,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 230,
                      padding: EdgeInsets.only(
                        right: 8,
                      ),
                      child: TextUtil(
                        text: widget.title,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        maxLine: 1,
                        alignment: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextUtil(
                        text: "ট ${widget.price}",
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: TextUtil(
                  text: Constants.ingredients,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                ),
                child: TextUtil(
                  text: widget.ingredientLists,
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  alignment: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 64,
        color: ColorUtil.blue_900,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context,true);
            },
            child: TextUtil(
              text: "Back",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorUtil.blue_900,
            ),
          ),
        ),
      ),
    );
  }
}
