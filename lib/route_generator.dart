/*import 'package:flutter/material.dart';
import 'package:learn_routes/main.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>FirstPage());
      case '/second':
        //validation of datatype
        if(args is String){
          return MaterialPageRoute(
            builder: (_)=>SecondPage(name: args,),
          );
        }
        return _routeError();
      default:
        return _routeError();
    }
  }
  static Route<dynamic> _routeError(){
    return MaterialPageRoute(builder:(_)=> Scaffold(
      appBar: AppBar(title: Text('Route Demo'),),
      body: Center(child: Text('error page not found'),),
    ));
  }
}*/