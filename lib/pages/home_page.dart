import 'dart:async';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentPage = 0;
  late final PageController _pageController;

  late final List<String> imagesSlider = const [
    'assets/images/relatorios.jpg',
    'assets/images/mapa.webp',
    'assets/images/aplicacoes.jpg',
  ];

  late final List<String> descriptionsSlider = [
    'Meus Relatórios',
    'Minhas Demarcações',
    'Minhas Aplicações',
  ];

  late final List<IconData> iconsSlider = [
    Icons.assessment,
    Icons.map,
    Icons.agriculture_outlined,
  ];

  late final List<String> pages = [
    '/reports',
    '/tillages',
    '/aplications',
  ];

  late final List<String> descriptionsCards = const [
    'Minhas Lavouras',
    'Condições Climáticas',
    'Minhas Aplicações',
  ];

  late final List<String> imagesCards = const [
    'assets/images/lavoura.png',
    'assets/images/clima.webp',
    'assets/images/aplicacoes2.jpg',
  ];

  late final List<IconData> iconsCards = const [
    Icons.grass_sharp,
    Icons.cloudy_snowing,
    Icons.agriculture_rounded,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentPage = (_currentPage + 1) % imagesSlider.length;
      });

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    late final double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        //title: Text('a'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 7, //listaDeItens.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Center(
              child: SizedBox(
                width: width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.asset('assets/logo/logo.png'),
              ),
            );
          } else if (index == 1) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * (0 + 0.015),
                ),
                slider(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (0 + 0.0075),
                ),
              ],
            );
          } else {
            int cardIndex = index - 2;
            return Column(
              children: [
                createContainer(
                  0.15,
                  context,
                  descriptionsCards[cardIndex % descriptionsCards.length],
                  imagesCards[cardIndex % imagesCards.length],
                  iconsCards[cardIndex % iconsCards.length],
                  pages[cardIndex % pages.length],
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (0 + 0.0075),
                ),
              ],
            );
          }
        },
      ),
      backgroundColor: Colors.white,
    );
  }

  Column createContainer(double height, BuildContext context,
      String description, String image, IconData icon, String page,
      [double x = 0.0075]) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          // TODO: Parar de usar o mediaquery desnecessariamente
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * height,
          decoration: createDecoration(image),
          child: createTextbutton(icon, context, page, description),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * (0 + x),
        ),
      ],
    );
  }

  BoxDecoration createDecoration(String image) {
    return BoxDecoration(
      color: const Color(0xFF9E9E9E),
      borderRadius: BorderRadius.circular(20.0),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(image),
      ),
    );
  }

  TextButton createTextbutton(
      IconData icon, BuildContext context, String page, String description) {
    return TextButton.icon(
      icon: Icon(icon),
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        alignment: Alignment.bottomLeft,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        pushPage(context, page);
      },
      label: Text(description),
    );
  }

  void pushPage(BuildContext context, String page) {
    Navigator.of(context).pushNamed(page);
  }

  SizedBox slider(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.25,
      child: createPageview(),
    );
  }

  PageView createPageview() {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return createContainer(0.25, context, descriptionsSlider[index],
            imagesSlider[index], iconsSlider[index], pages[index], 0);
      },
      itemCount: imagesSlider.length,
      onPageChanged: (int index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }

  List<Widget> _buildPageIndicator() {
    return List<Widget>.generate(
      imagesSlider.length,
      (int index) => _indicator(index == _currentPage),
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
