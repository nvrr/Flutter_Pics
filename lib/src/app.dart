import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';    
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async{
    counter ++ ;
    var response = 
         await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJSON(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
       floatingActionButton: FloatingActionButton(
         onPressed: fetchImage, 
         child: Icon(Icons.add)
         ),
       appBar: AppBar(
         title: Text('Lets see Images')
       ),
       body: ImageList(images)  
     ),
   );
  }
}