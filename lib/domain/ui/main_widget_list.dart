import 'package:flutter/material.dart';

class MainWidgetList extends StatelessWidget {
  const MainWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              color: Colors.amber,
            );
          }),
    );
  }
}
