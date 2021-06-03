import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuListItemsContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  MenuListItemsContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 500.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.size.width;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: Container(
        child: child,
        decoration:
            BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      ),
    );
  }
}
