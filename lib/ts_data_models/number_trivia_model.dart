
import 'package:flutter/cupertino.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivial{
  NumberTriviaModel({@required String text,@required int number}):super(number:number,text:text);

  factory NumberTriviaModel.fromJson(Map<String,dynamic> jsonMap){
    return NumberTriviaModel(text: jsonMap['text'],number: (jsonMap['number'] as num).toInt());
  }
  Map<String,dynamic> toJson(){
    return {
      "text": text,
      "number": number,
    };
  }
}