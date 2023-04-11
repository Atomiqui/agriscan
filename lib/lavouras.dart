import 'package:flutter/material.dart';

class Lavouras extends StatefulWidget {
  const Lavouras({super.key});

  @override
  _LavourasState createState() => _LavourasState();
}

class _LavourasState extends State<Lavouras> {

  _LavourasState() {
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
    return const Placeholder();
  }


}