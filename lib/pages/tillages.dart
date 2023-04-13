import 'package:flutter/material.dart';

class Tillages extends StatefulWidget {
  const Tillages({super.key});

  @override
  _TillagesState createState() => _TillagesState();
}

class _TillagesState extends State<Tillages> {

  _TillagesState() {
    //contrutor padrão
  }

  // Seguem os métodos em ordem:

  @override
  void initState() {
    // TODO: implement initState
    // posso alterar o state sem chamar setState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // Aqui já tem context
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
        title: Text('Tillages'),
        actions: [],
      ),
      body: Column(
        children: [],
      ),
    );
  }


}