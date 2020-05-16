

import 'package:dartz/dartz.dart';
import 'package:learn_routes/core_errors/failure.dart';
import 'package:learn_routes/core_errors/use_case.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';
import 'package:learn_routes/ts_domain_repositories/trivia_number_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivial,NoParams>{
  final TriviaNumberRepository triviaNumberRepository;

  GetRandomNumberTrivia(this.triviaNumberRepository);

  @override
  Future<Either<Failure, NumberTrivial>> call(NoParams params) async{
    // TODO: implement call
    return await triviaNumberRepository.getRandomTriviaNumber();
  }

}

