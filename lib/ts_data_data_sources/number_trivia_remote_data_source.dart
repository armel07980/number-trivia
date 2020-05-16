

import 'dart:convert';

import 'package:learn_routes/core_errors/exceptions.dart';
import 'package:learn_routes/ts_data_models/number_trivia_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class NumberTriviaRemoteDataSource{
  //calls the http number api.throws a server exception for all error code
  Future<NumberTriviaModel> getConcreteTriviaNumber(int number);

  //
  Future<NumberTriviaModel> getRandomTriviaNumber();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource{
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({@required this.client});

  @override
  Future<NumberTriviaModel> getConcreteTriviaNumber(int number) async{
    final response = await client.get(
      'http://numbersapi.com/$number',
      headers: {
        'Content-Type':'application/json',
      },
    );
    if(response.statusCode == 200){ 
      return NumberTriviaModel.fromJson(json.decode(response.body));
    }
    else {
      throw ServerException();
    }

  }

  @override
  Future<NumberTriviaModel> getRandomTriviaNumber() async{
    final response = await client.get(
      'http://numbersapi.com/random',
      headers: {
        'Content-Type':'application/json',
      },
    );
    if(response.statusCode == 200){
      return NumberTriviaModel.fromJson(json.decode(response.body));
    }
    else {
      throw ServerException();
    }
  }

}