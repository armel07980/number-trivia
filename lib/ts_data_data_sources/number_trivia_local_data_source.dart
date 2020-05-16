
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:learn_routes/core_errors/exceptions.dart';
import 'package:learn_routes/ts_data_models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';
abstract class  NumberTriviaLocalDataSource{
  //get last trivia number that was gotten when connection was ok
  Future<NumberTriviaModel> getLastNumberTrivia();
  //store last trivia number in cache
  Future<void> cacheNumberTrivia(NumberTriviaModel numberTriviaModel);

}
class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource{
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({@required this.sharedPreferences});
  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel numberTriviaModel) {
    return sharedPreferences.setString(CACHED_NUMBER_TRIVIA, json.encode(numberTriviaModel.toJson()));
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.get(CACHED_NUMBER_TRIVIA);
    if(jsonString != null){
      return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
    }
    else{throw CacheException();}
  }
 
}