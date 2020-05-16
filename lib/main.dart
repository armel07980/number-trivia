import 'package:flutter/material.dart';
//import 'package:learn_routes/route_generator.dart';
import 'package:learn_routes/ts_presentation_pages/number_trivia_page.dart';
import 'injection_container.dart' as di;


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberTriviaPage(),
      title: "Number Trivia",
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.green.shade600
      ),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Routes Demo"),),
      body: Center(child: Column(
        children: <Widget>[
          Text("First Page",style: TextStyle(fontSize: 50.0,color: Colors.black),),
          Padding(padding: const EdgeInsets.all(20.0),),
          RaisedButton(
            child: Text("next"), onPressed: ()=> Navigator.of(context).pushNamed('/second',arguments: "darel"),
          )
        ],
      ),),
    );
  }
}
class SecondPage extends StatelessWidget {
  final String name;
  SecondPage({Key key,this.name}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Route Demo'),),
      body: Center(
        child: Text("good $name"),
      ),
    );
  }
}

*/
