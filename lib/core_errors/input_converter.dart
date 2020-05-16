import 'package:dartz/dartz.dart';
import 'package:learn_routes/core_errors/failure.dart';

class InputConverter{
  Either<Failure,int> stringToUnsignInteger(String str){
   try{
     final integer = int.parse(str);
     if(integer<0) throw FormatException;
     return Right(integer);
   }
   on FormatException{
     return Left(InvalidInputFailure());
   }
  }
}
class InvalidInputFailure extends Failure{

}