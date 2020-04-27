import 'package:flutter/material.dart';
import 'package:flutter_widget_of_the_week/url_launcher.dart';
import 'package:flutter_widget_of_the_week/dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/url_launcher': (BuildContext context) => UrlLauncher(),
        '/dialog': (BuildContext context) => DialogExample(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Widget of the Week'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showSnackbar(BuildContext ctx) {
    final snackBar = SnackBar(
      content: Text('(・∀・)b'),
    );

    Scaffold.of(ctx).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: ListView(children: [
        _menuItem("url_launcher"),
        _menuItem("dialog"),
      ])),
      floatingActionButton: Builder(
        builder: (BuildContext ctx) {
          return FloatingActionButton(
            onPressed: () {
              _showSnackbar(ctx);
            },
            tooltip: 'Increment',
            child: Icon(Icons.play_arrow),
          );
        },
      ),
    );
  }

  Widget _menuItem(String title) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              border: new Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        Navigator.of(context).pushNamed('/$title');
      },
    );
  }
}
