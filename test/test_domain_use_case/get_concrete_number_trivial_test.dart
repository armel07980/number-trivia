import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';
import 'package:learn_routes/ts_domain_repositories/trivia_number_repository.dart';
import 'package:learn_routes/ts_domain_use_cases/get_concrete_trivial_number.dart';
import 'package:mockito/mockito.dart';

class MockTriviaNumberRepository extends Mock implements TriviaNumberRepository{

  void main(){
    MockTriviaNumberRepository mockTriviaNumberRepository;
    GetConcreteTriviaNumber getConcreteTriviaNumber;
    setUp((){
      mockTriviaNumberRepository = MockTriviaNumberRepository();
      getConcreteTriviaNumber =  GetConcreteTriviaNumber(mockTriviaNumberRepository);

    });
    final tnumber = 1;
    final trivia = NumberTrivial(number: tnumber,text: 'test');
    test('should get trivia for the number from repository', ()async{
      //arrange
      when(mockTriviaNumberRepository.getConcreteTriviaNumber(any)).thenAnswer((_)async=>Right(trivia));
      //act
      final result = await getConcreteTriviaNumber(Params(number: tnumber));

      //assert
      expect(result,Right(trivia));
      verify(mockTriviaNumberRepository.getConcreteTriviaNumber(tnumber));
      verifyNoMoreInteractions(mockTriviaNumberRepository);
    });
  }
}