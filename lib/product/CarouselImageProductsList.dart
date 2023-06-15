import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:theplugshop/Utility/CustomeColors.dart';

import '../ProductListData/Images.dart';
//import 'package:theplugshop/Utility/'; //''ThePlugShop\ThePlugShop\lib\Utility\UtilityClass.dart';
//import '../global.dart';





enum CarouselTypes { home, details }



class CarouselProductsList extends StatefulWidget {
  final CarouselTypes type;
  //final List<String> productsList;
  final List<Images>? productsList;
  final activeCarouselImage = Get.put(ActiveCarouselImage());

   CarouselProductsList({
    Key? key,
    required this.type,
    required this.productsList,
  }) : super(key: key);
  @override
  _CarouselProductsListState createState() => _CarouselProductsListState();
}


class ActiveCarouselImage  extends GetxController {
  var activeImageIndex = 0.obs;
}


class _CarouselProductsListState extends State<CarouselProductsList> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {



    return Container(
      height: MediaQuery.of(context).size.width *
          0.70,
      width: MediaQuery.of(context).size.width *
          0.98,
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: PageController(
                //widh specification
                viewportFraction:
                    widget.type == CarouselTypes.details ? 1 : .95,
              ),

              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },

              itemCount: widget.productsList!.length,
              itemBuilder: (ctx, indexxx) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: widget.type == CarouselTypes.details
                        ? Colors.white
                        : Colors.transparent,
                  ),
                  margin: widget.type == CarouselTypes.details &&  _currentIndex != indexxx
                      ? const EdgeInsets.symmetric(
                          horizontal: 9.0,
                          vertical: 15,
                        )
                      : const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 0,
                        ),
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      '${widget.productsList![indexxx].src}',
                      fit: BoxFit.contain,

                    ),
                  ),
                );
              },
            ),
          ),


          SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.productsList!.length,
              (i) {
                return Container(
                  width: 5,
                  height: 5,
                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == _currentIndex ? Colors.black : Colors.grey,
                  ),
                );
              },
            ),
          ),


        ],
      ),
    );
  }
}
