import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class NumberTrivial extends Equatable{
  final int number;
  final String text;
  //constructor
  NumberTrivial({
    @required this.text,
    @required this.number
}):super([text,number]);


}