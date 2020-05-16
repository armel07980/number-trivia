import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_routes/ts_presentation_bloc/number_trivia_bloc.dart';
import 'package:learn_routes/ts_presentation_bloc/number_trivia_events.dart';

class TriviaControls extends StatefulWidget {
  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  String inputStr;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextField(
            onSubmitted: (_){_addConcrete();},
            controller: controller,
            keyboardType: TextInputType.number,
            onChanged: (value){inputStr = value;},
            decoration: InputDecoration(
              hintText: "Enter a number",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Expanded(child: RaisedButton(
                child: Text("Search"),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: _addConcrete,
              )),
              SizedBox(width: 10.0,),
              Expanded(child:  RaisedButton(
                child: Text("Random"),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: _addRandom,
              ),)
            ],
          ),
        ],
      ),
    );
  }
  void _addConcrete(){
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).dispatch(GetTriviaForConcreteNumber(numberString: inputStr));
  }
  void _addRandom(){
    BlocProvider.of<NumberTriviaBloc>(context).dispatch(GetTriviaForRandomNumber());
  }
}
