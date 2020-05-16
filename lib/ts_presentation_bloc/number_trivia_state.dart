import 'package:equatable/equatable.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaState extends Equatable{
  NumberTriviaState([List props = const <dynamic>[]]):super(props);
}
class Empty extends NumberTriviaState{}
class Loading extends NumberTriviaState{}
class Loaded extends NumberTriviaState{
  final NumberTrivial numberTrivial;
  Loaded({@required this.numberTrivial}):super([numberTrivial]);

}
class Error extends NumberTriviaState{
  final message;
  Error({@required this.message}):super([message]);

}