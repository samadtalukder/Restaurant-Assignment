import 'package:flutter/material.dart';

class MenuExpandListItems extends StatefulWidget {
  final String title;
  final String image;

  const MenuExpandListItems({Key key, this.title, this.image})
      : super(key: key);

  @override
  _MenuExpandListItemsState createState() => _MenuExpandListItemsState();
}

class _MenuExpandListItemsState extends State<MenuExpandListItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Colors.grey,
          ),
          color: Colors.black),

    );
  }
}
