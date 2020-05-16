import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_routes/core_errors/input_converter.dart';

void main(){
  InputConverter inputConverter;
  setUp((){
    inputConverter =InputConverter();
  });
  group('stringToUnsigned', (){
    test('should return an int when the string represents an int>0', ()async{
      //arrange
        final str = '123';
      //act
        final result = inputConverter.stringToUnsignInteger(str);
      //assert
       expect(result, Right(123));
    });
    test('should return a failure a failure when the string is not an int', ()async{
      //arrange
      final str = 'ab123';
      //act
      final result = inputConverter.stringToUnsignInteger(str);
      //assert
      expect(result, Left(InvalidInputFailure()));
    });
    test('should return a failure when the string is a -ve int', ()async{
      //arrange
      final str = '-123';
      //act
      final result = inputConverter.stringToUnsignInteger(str);
      //assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}