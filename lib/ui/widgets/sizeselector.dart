import 'package:flutter/material.dart';

import '../global.dart';

class SizeSelector extends StatefulWidget {
  final int id;

  const SizeSelector({Key? key, required this.id}) : super(key: key);
  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5, //products[widget.id].size.length,
      itemBuilder: (ctx, i) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = i;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 9),
            alignment: Alignment.center,
            height: 35,
            width: 75,
            decoration: BoxDecoration(
              border: _selectedIndex == i ? Border.all(width: 2.5) : Border(),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: Text('Ok'), //Text("${products[widget.id].size[i]}"),
          ),
        );
      },
    );
  }
}
