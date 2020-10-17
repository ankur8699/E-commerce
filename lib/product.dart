import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store/details.dart';

class Products extends StatefulWidget {
  String get title => null;

//  String get category => null;


  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "https://api.gftpl.in/api/products/";
    var response = await http.get(url);
    if(response.statusCode == 200){
      var items = json.decode(response.body);

      setState(() {
        users = items;
        isLoading = false;
      });
    }else{
      users = [];
      isLoading = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: users.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: Hero(
                    tag:users[index]['title'] ,
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(),

                              // Pass the arguments as part of the RouteSettings. The
                              // DetailScreen reads the arguments from these settings.
                              settings: RouteSettings(
                                arguments: users[index],
                              ),
                            ),
                          );
                        },
                        child: GridTile(
                            footer: Container(
                              color: Colors.white70,
                              child: ListTile(
                                leading: Text(
                                  users[index]['title'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                               // title: Text(
                                 // "",
                                 // style: TextStyle(
                                   //   color: Colors.red, fontWeight: FontWeight.w800),
                               // ),
                                subtitle: Text(
                                 users[index]['category'],
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w800,
                                      decoration
                                          :TextDecoration.lineThrough),
                                ),
                              ),
                            ),
                            child: Image.network(
                              users[index]['image'],
                              fit: BoxFit.cover,
                            )),
                      ),
                    )),
              )








          );
        });
  }
}

