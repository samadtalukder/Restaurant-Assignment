import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restarurent_assignment/controller/menu_item_controller.dart';
import 'package:restarurent_assignment/utils/text_util.dart';
import 'package:restarurent_assignment/utils/color_util.dart';

import 'menu_list_items.dart';

class MenuPage extends StatelessWidget {

  MenuPage({Key key}) : super(key: key) {
    Get.put(MenuController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtil.blue_800,
        title: TextUtil(
          text: "Menu",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Obx(
          () {
            MenuController menuItemController=Get.find();

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
    );
  }
}
