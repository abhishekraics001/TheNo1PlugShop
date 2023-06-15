import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Utility/CustomeColors.dart';

class HomePage_Backup2 extends StatefulWidget {
  const HomePage_Backup2({Key? key}) : super(key: key);

  @override
  _HomePage_Backup2State createState() => _HomePage_Backup2State();
}

class _HomePage_Backup2State extends State<HomePage_Backup2> {
  List<String> categoryList = [
    "E-Liquids",
    "Disposable",
    "Vape Kits",
    "Pod Kits",
    "Coils",
    "Pods",
    "Tanks",
    "Mods",
    "Accessories",
    "Other Products",
    "Wholesale",
    "Suggest A Product"
  ];

  List<String> Product = [
    "Doozy Vape",
    "Nasty Juice",
    "Fantasi",
    "Bad Juice",
    "Dr Frost",
    "Doozy Vape",
    "Nasty Juice",
    "Fantasi",
    "Bad Juice",
    "Dr Frost",
    "Doozy Vape",
    "Nasty Juice",
    "Fantasi",
    "Bad Juice"
  ];

  List<String> images = [
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/doozy-vape-nic-salt-doozy-vape-10ml-nic-salt-10mg-apple-mango-theno1plug-34475927961822_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/nasty-juice-nic-salt-nasty-juice-10ml-nic-salt-10mg-bad-blood-theno1plug-34475888771294_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/nasty-juice-nic-salt-nasty-juice-10ml-nic-salt-10mg-bad-blood-theno1plug-34475888771294_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/bad-juice-nic-salt-bad-salt-10ml-nic-salt-10mg-custard-cream-theno1plug-36283697856734_540x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/dr-frost-nic-salt-dr-frost-ice-10ml-nic-salt-10mg-blue-raspberry-ice-theno1plug-36282416038110_540x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/doozy-vape-nic-salt-doozy-vape-10ml-nic-salt-10mg-apple-mango-theno1plug-34475927961822_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/nasty-juice-nic-salt-nasty-juice-10ml-nic-salt-10mg-bad-blood-theno1plug-34475888771294_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/nasty-juice-nic-salt-nasty-juice-10ml-nic-salt-10mg-bad-blood-theno1plug-34475888771294_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/bad-juice-nic-salt-bad-salt-10ml-nic-salt-10mg-custard-cream-theno1plug-36283697856734_540x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/dr-frost-nic-salt-dr-frost-ice-10ml-nic-salt-10mg-blue-raspberry-ice-theno1plug-36282416038110_540x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/doozy-vape-nic-salt-doozy-vape-10ml-nic-salt-10mg-apple-mango-theno1plug-34475927961822_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/nasty-juice-nic-salt-nasty-juice-10ml-nic-salt-10mg-bad-blood-theno1plug-34475888771294_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/nasty-juice-nic-salt-nasty-juice-10ml-nic-salt-10mg-bad-blood-theno1plug-34475888771294_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/bad-juice-nic-salt-bad-salt-10ml-nic-salt-10mg-custard-cream-theno1plug-36283697856734_540x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/dr-frost-nic-salt-dr-frost-ice-10ml-nic-salt-10mg-blue-raspberry-ice-theno1plug-36282416038110_540x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/doozy-vape-nic-salt-doozy-vape-10ml-nic-salt-10mg-apple-mango-theno1plug-34475927961822_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/nasty-juice-nic-salt-nasty-juice-10ml-nic-salt-10mg-bad-blood-theno1plug-34475888771294_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/nasty-juice-nic-salt-nasty-juice-10ml-nic-salt-10mg-bad-blood-theno1plug-34475888771294_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/bad-juice-nic-salt-bad-salt-10ml-nic-salt-10mg-custard-cream-theno1plug-36283697856734_540x.png",
  ];

  List<String> imagesCousal = [
    "https://cdn.pixabay.com/photo/2018/04/30/07/30/pair-3361949_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/12/16/22/25/woman-570883_1280.jpg",
    "https://cdn.pixabay.com/photo/2013/07/18/20/26/sea-164989_1280.jpg",
  ];

  List<String> socialmeadia = [
    "Facebook",
    "Youtube",
    "Instagram",
    "Twitter",
    "Linkedin"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                  decoration:
                      new BoxDecoration(color: CustomeColors.kPrimaryColor),
                  child: Padding(
                      padding: const EdgeInsets.all(5), child: searchBox())),
            ),
            Container(
                child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(5.0),
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categoryList.map((country) {
                        return categorySlider(country);
                      }).toList(),
                    )),
              ],
            )),
            Container(
              //padding: EdgeInsets.all(1),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    height: 900,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Container(
                            height: 215,
                            child: Column(children: [
                              buildCarouselSlider(),
                              buildRowImageSliderIndeicator(),
                            ]),
                          );
                        } else if (index == 1) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                buildListHeader("Best Collection"),
                                bestCollectionGridView(),
                              ],
                            ),
                          );
                        } else if (index == 2) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                wholeShalesCollection(),
                              ],
                            ),
                          );
                        } else if (index == 3) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                buildListHeader("Tranding Collection"),
                                trandingCollectionsGridView(),
                              ],
                            ),
                          );
                        } else if (index == 4) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                buildListHeader("Find us on Social Media"),
                                Container(
                                    padding: EdgeInsets.all(5.0),
                                    height: 50,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: socialmeadia.map((smName) {
                                        return socialMediaSlider(smName);
                                      }).toList(),
                                    )),
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "N/A",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.amber),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            /*    Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(1),
              child: Column(
                children: [
                  Container(child: buildGridView() //buildGridView()
                      ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );

    /*Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {},
                // controller: editingController,
                style: TextStyle(fontSize: 16, color: Colors.white),

                decoration: InputDecoration(
                  //labelText: "Search",
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          width: 3, color: CustomeColors.kPrimaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  fillColor: Colors.black,
                  filled: true,
                ),
              ),
            ),
            */ /*Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Itams $index'),
              );
            },
          ),
        ),*/ /*


          //  Expanded(
            Container(
            height: 50,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) =>
                    //Card(

                      Container(
                        height: 1000,
                        width: 100,

                        alignment:Alignment.topCenter,
                        //padding: EdgeInsets.all(15),
                        child: Column(
                          children:[
                              Padding(padding: EdgeInsets.all(15), //apply padding to all four sides
                                child: Card(

                                    child: Text('Cat $index'),),
                      ),],),),


                      //child: Center(child: Text('Cat $index', textAlign: TextAlign.center,style: pa,)),
                   // ),
              ),
            ),
           // ),


            Expanded(
              //padding: EdgeInsets.all(12.0),
              child: sectionList( GridView.count(
                crossAxisCount: 2,
                children: List.generate(100, (index) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          'https://picsum.photos/500/500?random=$index',
                          width: MediaQuery.of(context).size.width/ 2 - 5,
                          height:  MediaQuery.of(context).size.width / 2 - 5,
                        ),
                        Text(
                          'Text $index',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline5,
                        ),
                      ],
                    ),
                  );
                }),
              ),),
            ),
            //mainAxisSize: MainAxisSize.min,
            //children: <Widget>[
*/ /*
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Headline',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 100.0,

                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Center(child: Text('Dummy Card Text')),
                  ),
                ),
              ),
              Text(
                'Demo Headline 2',
                style: TextStyle(fontSize: 18),
              ),
              Card(
                child: ListTile(
                    title: Text('Motivation $int'),
                    subtitle: Text('this is a description of the motivation')),
              ),
              Card(
                child: ListTile(
                    title: Text('Motivation $int'),
                    subtitle: Text('this is a description of the motivation')),
              ),
              Card(
                child: ListTile(
                    title: Text('Motivation $int'),
                    subtitle: Text('this is a description of the motivation')),
              ),
              Card(
                child: ListTile(
                    title: Text('Motivation $int'),
                    subtitle: Text('this is a description of the motivation')),
              ),
              Card(
                child: ListTile(
                    title: Text('Motivation $int'),
                    subtitle: Text('this is a description of the motivation')),
              ),
            ],
          ),
        ),*/ /*
          ],
        ));*/
  }

  Align buildListHeader(String str) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        //color: Colors.red,
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.only(top: 5),
        child: Text(
          '$str',
          style: TextStyle(
              fontSize: 16,
              color: CustomeColors.bodyTextColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Align buildListHeaderCenter(String str) {
    return Align(
      alignment: Alignment.bottomCenter,
      //color: Colors.orangeAccent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 20,
        color: CustomeColors.lighGray,
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.only(top: 5),
        alignment: Alignment.bottomCenter,
        child: Text(
          '$str',
          style: TextStyle(
              fontSize: 16,
              color: CustomeColors.bodyBgColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  TextField searchBox() {
    return TextField(
      onChanged: (value) {
        print("search onChanged: $value");
      },
      onSubmitted: (value) {
        print("search onSubmitted:  $value");
      },
      style: TextStyle(fontSize: 16, color: Colors.white),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        hintText: "Search",
        hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
        prefixIcon: Icon(Icons.search, color: Colors.white),
        border: new OutlineInputBorder(
            borderSide:
                new BorderSide(width: 3, color: CustomeColors.kPrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        fillColor: Colors.black,
        filled: true,
      ),
    );
  }

  Widget categorySlider(String title) {
    return Container(
      constraints: BoxConstraints(
          minHeight: 55, minWidth: 40, maxHeight: 60, maxWidth: 100),
      margin: EdgeInsets.all(3),
      decoration: myBoxBorderDecoration(),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            color: CustomeColors.bodyTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w900),
      ),
    );
  }

  BoxDecoration myBoxBorderDecoration() {
    return BoxDecoration(
      color: CustomeColors.bodyBgColor,
      border: Border.all(
        color: CustomeColors.kPrimaryColor,
        width: 1.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
  }

  late PageController _imageSliderpageController;
  int imageSliderCurrentActivePos = 0;
  @override
  void initState() {
    super.initState();
    _imageSliderpageController = PageController(viewportFraction: 0.8);
  }

  Row buildRowImageSliderIndeicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imagesCousal.map((url) {
        int index = imagesCousal.indexOf(url);
        return Container(
          width: 5.0,
          height: 5.0,
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: imageSliderCurrentActivePos == index
                ? Color.fromRGBO(0, 0, 0, 0.9)
                : Color.fromRGBO(0, 0, 0, 0.4),
          ),
        );
      }).toList(),
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider.builder(
      itemCount: imagesCousal.length,
      options: CarouselOptions(
          viewportFraction: 1,
          height: 200,
          autoPlay: true,
          aspectRatio: 2 / 1,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              imageSliderCurrentActivePos = index;
            });
          }),
      itemBuilder: (BuildContext context, int pagePosition, _) {
        bool active = pagePosition == imageSliderCurrentActivePos;
        return imageCrousalSlider(images, pagePosition, active);
      },
    );
  }

  AnimatedContainer imageCrousalSlider(images, pagePosition, active) {
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width,
      //height:  MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          //image: Image.network(images[pagePosition], fit: BoxFit.cover)
          image: DecorationImage(
        image: NetworkImage(imagesCousal[pagePosition]),
        fit: BoxFit.fill,
      )),
    );
  }

  GridView bestCollectionGridView() {
    return GridView.builder(
      itemCount: 6,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: Container(
              //color: Colors.transparent,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage("assets/images/icon_48.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              //child: Text("YOUR TEXT"),
              /*  child: Padding(
                padding: EdgeInsets.all(1), //apply padding to all four sides
                child: Center(
                  child: Text(Product[index], textAlign: TextAlign.end),
                ),
              ),*/
              child: buildListHeaderCenter('Hello')),
        );

        /*new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          elevation: 1,
          margin: EdgeInsets.all(2),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                //child: Image.network(images[index], fit: BoxFit.cover),
                //child: Image.asset('./images/logo.png'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  //child: Image.asset('assets/images/logo.png',
                  child: Image.asset('assets/images/icon_48.png',
                  fit: BoxFit.fill,
                  //height: 32,
                  //width: 32,
                ),
                )
              ),
              Padding(
                padding: EdgeInsets.all(1), //apply padding to all four sides
                child: Center(
                  child: Text(Product[index], textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        );*/
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1.4 / 1),
      padding: EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  GridView wholeShalesCollection() {
    return GridView.builder(
      itemCount: 1,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          elevation: 2,
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.network(images[index], fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.all(1), //apply padding to all four sides
                child: Center(
                  child: Text(Product[index], textAlign: TextAlign.center),
                ),
              ),
              //Text(Product[index], textAlign: TextAlign.center,  style: TextStyle(fontSize: 12.0)),//may be the structure of your data is different
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 5 / 1),
      padding: EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  GridView trandingCollectionsGridView() {
    return GridView.builder(
      itemCount: 8,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.network(images[index], fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.all(1), //apply padding to all four sides
                child: Center(
                  child: Text(Product[index], textAlign: TextAlign.center),
                ),
              ),
              //Text(Product[index], textAlign: TextAlign.center,  style: TextStyle(fontSize: 12.0)),//may be the structure of your data is different
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 3 / 1),
      padding: EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  GridView socailMediaCollectionsGridView() {
    return GridView.builder(
      itemCount: 4,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.network(images[index], fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.all(1), //apply padding to all four sides
                child: Center(
                  child: Text(Product[index], textAlign: TextAlign.center),
                ),
              ),
              //Text(Product[index], textAlign: TextAlign.center,  style: TextStyle(fontSize: 12.0)),//may be the structure of your data is different
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 3 / 1),
      padding: EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  Widget socialMediaSlider(String title) {
    return Container(
      constraints: BoxConstraints(
          minHeight: 55, minWidth: 40, maxHeight: 70, maxWidth: 100),
      margin: EdgeInsets.all(3),
      //width: 70,
      //height: 44,
      //color: Colors.white,
      decoration: myBoxBorderDecoration(),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            color: CustomeColors.bodyTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
