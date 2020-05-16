import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_routes/core_errors/failure.dart';
import 'package:learn_routes/core_errors/use_case.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';
import 'package:learn_routes/ts_domain_repositories/trivia_number_repository.dart';
import 'package:meta/meta.dart';

class GetConcreteTriviaNumber implements UseCase<NumberTrivial,Params>{
  final TriviaNumberRepository triviaNumberRepository;
  GetConcreteTriviaNumber(this.triviaNumberRepository);

  @override
 Future<Either<Failure,NumberTrivial>> call(Params params)async{
   return await triviaNumberRepository.getConcreteTriviaNumber(params.number);
  }
}
class Params extends Equatable{
  final int number;

  Params({@required this.number}):super([number]);
}