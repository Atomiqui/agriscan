import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        drawer: const Drawer(),

        appBar: AppBar(

          title: const Center(
            child: Text('Frist Test'),
          ),

          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ],

        ),

        body: const Column(
          children: [
            Center(
              child: Image(
                image: AssetImage('images/logo.png'),
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),

      ),

      theme: ThemeData.dark(),
    );
  }
}
