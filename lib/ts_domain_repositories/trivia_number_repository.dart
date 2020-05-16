import 'package:dartz/dartz.dart';
import 'package:learn_routes/core_errors/failure.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';

abstract class TriviaNumberRepository{
 Future<Either<Failure,NumberTrivial>> getConcreteTriviaNumber(int number);
 Future<Either<Failure,NumberTrivial>> getRandomTriviaNumber();
}