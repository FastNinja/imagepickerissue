import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Screen2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Image was picked")),
        body: new Text("Screen2"));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Null> _freezesAfterNavigation(BuildContext context) async {
    var _imageFile = await ImagePicker.pickImage();

    // this navigation freezes and the whole app
    Navigator
        .of(context, rootNavigator: true)
        .push(new MaterialPageRoute<String>(
            settings: const RouteSettings(name: '/screen2'),
            builder: (BuildContext context) {
              return new Screen2Page();
            }));
  }

  Future<Null> _worksOK(BuildContext context) async {
    // this navigation works
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: '/screen2'),
        builder: (BuildContext context) {
          return new Screen2Page();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text("Select Image and Feezes"),
              onPressed: () => _freezesAfterNavigation(context),
            ),
            new Divider(),
            new RaisedButton(
              child: new Text("Works OK"),
              onPressed: () => _worksOK(context),
            )
          ],
        ),
      ),
    );
  }
}
