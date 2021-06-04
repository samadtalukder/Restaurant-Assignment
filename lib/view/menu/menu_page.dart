import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restarurent_assignment/controller/menu_item_controller.dart';
import 'package:restarurent_assignment/utils/color_util.dart';
import 'package:restarurent_assignment/utils/constants.dart';
import 'package:restarurent_assignment/utils/text_util.dart';

import 'menu_list_items.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key key}) : super(key: key) {
    Get.put(MenuController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: ColorUtil.blue_800,
        title: TextUtil(
          text: Constants.menu,
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Obx(
          () {
            MenuController menuItemController = Get.find();

            if (menuItemController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MenuListItems(
                    title: menuItemController.menuItemList[index].name,
                    menusList: menuItemController.menuItemList[index].menus,
                  );
                },
                itemCount: menuItemController.menuItemList.length,
              );
            }
          },
        ),
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
