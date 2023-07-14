import 'package:cript_kst/domain/data/api_client.dart';
import 'package:flutter/material.dart';

class MainWidgetList extends StatelessWidget {
  final api = ApiClient();
  MainWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    final yesterday = DateTime.now().millisecondsSinceEpoch - 86400000;
    final prevDay = yesterday - 86400000;
    print(yesterday);
    print(prevDay);
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
