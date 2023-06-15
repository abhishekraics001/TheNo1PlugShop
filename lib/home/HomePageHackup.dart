import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Utility/CustomeColors.dart';

class HomePageBackup extends StatefulWidget {
  const HomePageBackup({Key? key}) : super(key: key);

  @override
  _HomePageBackupState createState() => _HomePageBackupState();
}

class _HomePageBackupState extends State<HomePageBackup> {
  List<String> countries = [
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
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/doozy-vape-nic-salt-doozy-vape-10ml-nic-salt-10mg-apple-mango-theno1plug-34475927961822_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/nasty-juice-nic-salt-nasty-juice-10ml-nic-salt-10mg-bad-blood-theno1plug-34475888771294_900x.png",
    "https://cdn.shopify.com/s/files/1/0606/5317/5006/products/nasty-juice-nic-salt-nasty-juice-10ml-nic-salt-10mg-bad-blood-theno1plug-34475888771294_900x.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //padding: const EdgeInsets.all(16.0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              //child: searchBox(),
              child: Container(
                  decoration:
                      new BoxDecoration(color: CustomeColors.kPrimaryColor),
                  child: Padding(
                      padding: const EdgeInsets.all(5), child: searchBox())),
            ),
            Container(
                //padding: EdgeInsets.all(1),
                child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(5.0),
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: countries.map((country) {
                        return categorySlider(country);
                      }).toList(),
                    )),
              ],
            )),
            Container(
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                      itemCount: imagesCousal.length,
                      options: CarouselOptions(
                          height: 180,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPos = index;
                            });
                          }),
                      itemBuilder: (BuildContext context, int pagePosition, _) {
                        //(context, pagePosition) {
                        bool active = pagePosition == currentPos;
                        return slider(images, pagePosition, active);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imagesCousal.map((url) {
                        int index = imagesCousal.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPos == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ]),
            ),
            Container(
                // child:
                ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(1),
              child: Column(
                children: [
                  Container(child: buildGridView() //buildGridView()
                      ),
                ],
              ),
            ),
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

  TextField searchBox() {
    return TextField(
      onChanged: (value) {
        print("search onChanged: $value");
      },
      onSubmitted: (value) {
        print("search onSubmitted:  $value");
      },

      // controller: editingController,
      style: TextStyle(fontSize: 16, color: Colors.white),
      textInputAction: TextInputAction.search,

      decoration: InputDecoration(
        //labelText: "Search",

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
          minHeight: 55, minWidth: 40, maxHeight: 70, maxWidth: 100),
      margin: EdgeInsets.all(3),
      //width: 70,
      //height: 44,
      //color: Colors.white,
      decoration: myBoxDecoration(),
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

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: CustomeColors.bodyBgColor,
      border: Border.all(
        color:
            CustomeColors.kPrimaryColor, //                   <--- border color
        width: 1.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
  }

  GridView buildGridView() {
    return GridView.builder(
      itemCount: images.length,
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
                padding: EdgeInsets.all(15), //apply padding to all four sides
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
          crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 1),
      padding: EdgeInsets.all(5),
      shrinkWrap: true,
    );
  }

  late PageController _pageController;
  int currentPos = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          //image: Image.network(images[pagePosition], fit: BoxFit.cover)
          image:
              DecorationImage(image: NetworkImage(imagesCousal[pagePosition]))),
    );
  }
}
