import 'package:flutter/material.dart';
import 'package:simple_timeline/simple_timeline.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Timeline"),
      ),
      body: SimpleTimeline(
        children: <Widget>[
          _timelineContent(context, "Hi There", Icons.near_me),
          _timelineContent(context, "Morning", Icons.wb_sunny),
          _timelineContent(context, "Nite", Icons.brightness_3),
        ],
      ),
    );
  }

  Widget _timelineContent(context, String title, IconData icon) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
