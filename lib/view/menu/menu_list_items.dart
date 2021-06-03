import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restarurent_assignment/model/ResponseMenuItem.dart';
import 'package:restarurent_assignment/network/api_url.dart';
import 'package:restarurent_assignment/utils/text_util.dart';
import 'package:restarurent_assignment/widget/custom_expansion_tile.dart'
    as custom;
import 'package:restarurent_assignment/view/menu/menu_details_page.dart';

class MenuListItems extends StatefulWidget {
  final String title;
  final List<Menu> menusList;

  const MenuListItems({Key key, this.title, this.menusList}) : super(key: key);

  @override
  _MenuListItemsState createState() => _MenuListItemsState();
}

class _MenuListItemsState extends State<MenuListItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      child: Card(
        margin: EdgeInsets.zero,
        child: custom.ExpansionTile(
          backgroundColor: Colors.white,
          headerBackgroundColor: Color(0xfff2f4f6),
          title: TextUtil(
            text: widget.title,
            fontSize: 17,
            fontWeight: FontWeight.w400,
            alignment: TextAlign.start,
            color: Colors.black87,
          ),
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.menusList.length,
              itemBuilder: (BuildContext context, int index) {
                var item = widget.menusList[index];

                return InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            APIUrl.baseUrl + item.photo,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        TextUtil(
                          text: item.title,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Get.to(
                      MenuDetailsPage(
                        title: item.title,
                        image: item.photo,
                        price: item.price,
                        ingredientLists: item.ingredientLists,
                      ),
                      /*arguments: [
                        item.title,
                        item.photo,
                        item.ingredientLists,
                        item.price

                      ],*/
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
