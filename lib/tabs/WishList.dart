import 'package:flutter/material.dart';

import '../Utility/CustomeColors.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomeColors.bodyBgColor,
      child: Center(
        child: Text(
          "WishList \ncoming soon....",
          style: TextStyle(
            color: CustomeColors.bodyTextColor,
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
