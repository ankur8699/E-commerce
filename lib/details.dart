import 'package:flutter/material.dart';
import 'package:store/product.dart';



class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products a = ModalRoute.of(context).settings.arguments;


    // Use the Todo to create the UI.

    return Scaffold(
      appBar: AppBar(
        title: Text(a.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('a'),
      ),
    );
  }
}
