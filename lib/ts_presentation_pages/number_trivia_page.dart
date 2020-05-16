import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_routes/ts_presentation_bloc/bloc.dart';
import 'package:learn_routes/ts_presentation_widgets/loading_widget.dart';
import 'package:learn_routes/ts_presentation_widgets/message_display.dart';
import 'package:learn_routes/ts_presentation_widgets/trivia_controls.dart';
import 'package:learn_routes/ts_presentation_widgets/trivia_display.dart';

import '../injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Trivia"),
      ),
      body: buildBody(context),
    );
  }
  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context){
    return BlocProvider(
      builder: (_)=>sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
                 BlocBuilder<NumberTriviaBloc,NumberTriviaState>(
                  builder: (context,state){
                    if(state is Empty){
                      return MessageDisplay(message: "Start Searching",);}
                    else if(state is Error){
                      return MessageDisplay(message: state.message,);}
                    else if(state is Loading){
                      return LoadingBar();
                    }
                    else if(state is Loaded){
                      return TriviaDisplay(numberTrivial: state.numberTrivial);
                    }
                    else{return MessageDisplay(message: "",);}

                  },
                ),
              SizedBox(
                height: 20.0,
              ),
              TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}


