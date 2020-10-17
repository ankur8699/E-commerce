import 'package:store/product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//my own imports

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child:  new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/1.jpg'),
          AssetImage('images/2.jpg'),
          AssetImage('images/3.jpg'),
          AssetImage('images/4.jpg'),
          AssetImage('images/5.jpg'),


        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.greenAccent,
        title: Text('Store', style: TextStyle(color:Colors.black),),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      drawer: new Drawer(


        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(

              accountName: Text('Admin'),
              accountEmail: Text('Admin@gmail.com'),

              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.greenAccent,
              ),
            ),

//            body

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.black,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person , color: Colors.black,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket , color: Colors.black,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Categoris'),
                leading: Icon(Icons.dashboard , color: Colors.black,),
              ),
            ),



            Divider(),

            InkWell(
              onTap: (){

              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit, color: Colors.black,),
              ),
            ),

          ],
        ),
      ),

      body: new Column(
        children: <Widget>[
          //image carousel begins here
          image_carousel,

          //padding widget
          new Padding(padding: const EdgeInsets.all(20.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Categories',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),)),),

          //Horizontal list view begins here
          // HorizontalList(),

          //padding widget
          //new Padding(padding: const EdgeInsets.all(8.0),
            //child: Container(
              //  alignment: Alignment.centerLeft,
                //child: new Text('Recent products')),),

          //grid view
          Flexible(child: Products()),

        ],
      ),
    );
  }
}
