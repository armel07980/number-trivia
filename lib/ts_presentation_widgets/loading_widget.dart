import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  LoadingBar({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
