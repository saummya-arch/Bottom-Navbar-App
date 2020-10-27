import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.teal,
    brightness: Brightness.dark,
  ),
  home: new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: new AppBar(
        
        title: new Text("Utility App")),
      body: new TabBarView( 
          children: <Widget>[new NewPage("First"),new NewPage("Second")],
          controller: tabController,
        ),
        bottomNavigationBar: new Material(
          child: new TabBar(
            controller: tabController,
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.favorite),
              ),
              new Tab(
                icon: new Icon(Icons.email),
              )
            ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {

final String title;
NewPage(this.title);
@override
Widget build(BuildContext context) {
   
    return new Scaffold(
      body: new Center(
        child: new Text(title),
      ),
    );
  }
}