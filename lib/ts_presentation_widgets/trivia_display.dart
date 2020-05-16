import 'package:flutter/material.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';

class TriviaDisplay extends StatelessWidget {
  final NumberTrivial numberTrivial;
  TriviaDisplay({Key key,@required this.numberTrivial}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: Column(
           children: <Widget>[
             Center(
               child: Text( numberTrivial.number.toString(),
                 style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center,),
             ),
             Expanded(
               child: Center(
                 child: SingleChildScrollView(
                     child: Text(numberTrivial.text.toString(),style: TextStyle(fontSize: 25.0),textAlign: TextAlign.center,),
                 ),
               ),
             ),
           ],
      ),
    );
  }
}

