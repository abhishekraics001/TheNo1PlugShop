import 'package:flutter/material.dart';
import '../Utility/CustomeColors.dart';

class RewarsPage extends StatelessWidget {
  const RewarsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomeColors.bodyBgColor,
      child: Center(
        child: Text(
          "Rewards \ncoming soon....",
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