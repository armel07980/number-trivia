import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:learn_routes/core_errors/file_reader.dart';
import 'package:learn_routes/ts_data_models/number_trivia_model.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';

void main(){

  final testNumberTriviaModel = NumberTriviaModel(number: 1,text:'test');
  test(
          'should be a subclass of NumberTrivia(entity)',
          ()async{
            //testNumberTriviaModel should be a NumberTrivial
          expect(testNumberTriviaModel,isA<NumberTrivial>());
  });
  group('fromJson', (){
    test('should return a valid model when the json number is an integer',()async{
      //arrange
      final Map<String,dynamic> jsonMap =
          json.decode(readFile('trivia.json'));

      //act
      final result = NumberTriviaModel.fromJson(jsonMap);

      //assert
      expect(testNumberTriviaModel,result);
    });
    test('should return a valid model when the json number is an double',()async{
      //arrange
      final Map<String,dynamic> jsonMap =
      json.decode(readFile('trivia_double.json'));

      //act
      final result = NumberTriviaModel.fromJson(jsonMap);

      //assert
      expect(testNumberTriviaModel,result);
    });
  });
  group('toJson',(){
    test('should return a json map containing the proper data', ()async{
      //act
      final result = testNumberTriviaModel.toJson();

      //assert
      final expectedResult = {
        "text": "1 is d first number greater than zero ",
        "number": 1,
      };
      expect(result,expectedResult);
    });
  });
}