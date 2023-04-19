import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: 5, // Lista_de_lavouras.length
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/aplicacoes.jpg'),
                    radius: 20.0, // ajuste este valor para alterar o tamanho da imagem
                  ),
                  SizedBox(width: 10.0), // espaço entre a imagem e o próximo widget no row
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lavoura do pai do Gelso',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                          //fontStyle: FontStyle.italic,
                          //decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Última modificação em 10/03/2022',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                          //fontStyle: FontStyle.italic,
                          //decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: null,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.55,
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/clima.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        newRichText('Dimensão', '150 Hectares'),
                        newRichText('Localização', 'Jóia - RS'),
                        newRichText('Cultivo', 'Mandioca'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        }
      )
    );
  }

  RichText newRichText(String text1, String text2) {
    return RichText(
      text: TextSpan(
      children: [
        TextSpan(
          text: '$text1\n',
          style: TextStyle(
            color: Colors.grey,
            fontWeight:FontWeight.normal,
            fontSize: 11.0,
          ),
        ),
        TextSpan(
          text: text2,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
  }
}