



import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_routes/core_errors/failure.dart';
import 'package:learn_routes/core_errors/input_converter.dart';
import 'package:learn_routes/core_errors/use_case.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';
import 'package:learn_routes/ts_domain_use_cases/get_concrete_trivial_number.dart';
import 'package:learn_routes/ts_domain_use_cases/get_random_number_trivia.dart';
import 'package:learn_routes/ts_presentation_bloc/bloc.dart';
import 'package:learn_routes/ts_presentation_bloc/number_trivia_events.dart';
import 'package:learn_routes/ts_presentation_bloc/number_trivia_state.dart';
import 'package:bloc/bloc.dart';


const String SERVER_FAILURE = "Server Failed";
const String CACHE_FAILURE = "Cache Failed To Load Data";
const String INVALID_INPUT_FAILURE_MESSAGE = "Invalid input. Only numbers greater than zero";

class NumberTriviaBloc extends Bloc<NumberTriviaEvent,NumberTriviaState>{
  final GetConcreteTriviaNumber getConcreteTriviaNumber;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;


  NumberTriviaBloc({
      @required GetConcreteTriviaNumber concrete,
      @required GetRandomNumberTrivia random,
      @required this.inputConverter}):
        assert(concrete != null,),
        assert(random != null,),
        assert(inputConverter != null,),
        getConcreteTriviaNumber = concrete,
        getRandomNumberTrivia = random;


  @override
  NumberTriviaState get initialState => Empty();

  @override
  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event)async*{
    if(event is GetTriviaForConcreteNumber) {
      final inputEither = inputConverter.stringToUnsignInteger(
          event.numberString);
      //yield*: wen ever we yield somethx from the higher order function, it will also be yielded by d contain* func
      //mapEventToState wc will also emit it as a state stream
      yield* inputEither.fold((failure)async*{
            yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
        }, (integer)async*{
        yield Loading();
        final failureOrTrivia = await getConcreteTriviaNumber(Params(number: integer));
       yield* _eitherLoadedOrErrorState(failureOrTrivia);
      });
    }
    else if(event is GetTriviaForRandomNumber ){
        yield Loading();
        final failureOrTrivia = await getRandomNumberTrivia(NoParams()); 
       yield*  _eitherLoadedOrErrorState(failureOrTrivia);
    }
}

  Stream<NumberTriviaState> _eitherLoadedOrErrorState(Either<Failure, NumberTrivial> failureOrTrivia,)async* {
    yield failureOrTrivia.fold((
        failure)=> Error(message:_mapFailureToMessage(failure) ), (trivia)=> Loaded(numberTrivial: trivia));
  }
    String _mapFailureToMessage(Failure failure){
       switch(failure.runtimeType){
         case ServerFailure:
           return SERVER_FAILURE;
         case CacheFailure:
            return CACHE_FAILURE;
         default:
            return "Unexpected Error";
       }
    }
}


