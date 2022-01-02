import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          title: TextButton(
            onPressed: () => Navigator.of(context).pushNamed('/todo'),
            child: Text(
              'Welcome',
              style: TextStyle(color: Colors.white),
            ),
          ),
          centerTitle: true,
        ),
      );
}
