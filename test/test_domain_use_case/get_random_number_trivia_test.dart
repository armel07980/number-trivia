import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_routes/core_errors/use_case.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';
import 'package:learn_routes/ts_domain_repositories/trivia_number_repository.dart';
import 'package:learn_routes/ts_domain_use_cases/get_concrete_trivial_number.dart';
import 'package:learn_routes/ts_domain_use_cases/get_random_number_trivia.dart';
import 'package:mockito/mockito.dart';

class MockTriviaNumberRepository extends Mock implements TriviaNumberRepository{

  void main(){
    MockTriviaNumberRepository mockTriviaNumberRepository;
    GetRandomNumberTrivia getRandomNumberTrivia;
    setUp((){
      mockTriviaNumberRepository = MockTriviaNumberRepository();
      getRandomNumberTrivia =  GetRandomNumberTrivia(mockTriviaNumberRepository);

    });
    final trivia = NumberTrivial(number: 1,text: 'test');
    test('should get trivia from repository', ()async{
      //arrange
      when(mockTriviaNumberRepository.getRandomTriviaNumber()).thenAnswer((_)async=>Right(trivia));
      //act
      final result = await getRandomNumberTrivia(NoParams());

      //assert
      expect(result,Right(trivia));
      verify(mockTriviaNumberRepository.getRandomTriviaNumber());
      verifyNoMoreInteractions(mockTriviaNumberRepository);
    });
  }
}