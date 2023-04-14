import 'dart:async';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  late final PageController _pageController;

  final List<String> _images_slider = [
    'assets/images/relatorios.jpg',
    'assets/images/mapa.webp',
    'assets/images/aplicacoes.jpg',
  ];

  final List<String> _descriptions_slider = [
    'Meus Relatórios',
    'Minhas Demarcações',
    'Minhas Aplicações',
  ];

  final List<IconData> _icons_slider = [
    Icons.assessment,
    Icons.map,
    Icons.agriculture_outlined,
  ];

  final List<String> _pages = [
    '/reports',
    '/tillages',
    '/aplications',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentPage = (_currentPage + 1) % _images_slider.length;
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
    final double width = MediaQuery.of(context).size.width * 0.8;
    List<String> descriptions_cards = [
      'Minhas Lavouras',
      'Condições Climáticas',
      'Minhas Aplicações',
    ];

    List<String> images_cards = [
      'assets/images/lavoura.png',
      'assets/images/clima.webp',
      'assets/images/aplicacoes2.jpg',
    ];

    List<IconData> icons_cards = [
      Icons.grass_sharp,
      Icons.cloudy_snowing,
      Icons.agriculture_rounded,
    ];

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Definição da imagem que representa a logo:
          Center(
            child: SizedBox(
              width: width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Image.asset('assets/logo/logo.png'),
            ),
          ),

          // Definição do Slider
          Column(
            children: [
              slider(context),
              // Um espacinho entre pra não ficar grudado
              const SizedBox(
                height: 5,
              ),
              // Definição das 3 bolinhas em baixo do slider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ],
          ),

          // Definição de cada um dos 3 cards inferiores
          create_container(0.15, context, descriptions_cards[0],
              images_cards[0], icons_cards[0], '/tillages'),
          create_container(0.15, context, descriptions_cards[1],
              images_cards[1], icons_cards[1], '/climate'),
          create_container(0.15, context, descriptions_cards[2],
              images_cards[2], icons_cards[2], '/aplications'),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Container create_container(double height, BuildContext context,
      String _description, String _image, IconData _icon, String page) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * height,
      decoration: create_decoration(_image),
      child: create_textbutton(_icon, context, page, _description),
    );
  }

  BoxDecoration create_decoration(String _image) {
    return BoxDecoration(
      color: const Color(0xFF9E9E9E),
      borderRadius: BorderRadius.circular(20.0),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(_image),
      ),
    );
  }

  TextButton create_textbutton(IconData _icon, BuildContext context,
      String page, String _description) {
    return TextButton.icon(
      icon: Icon(_icon),
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        alignment: Alignment.bottomLeft,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        push_page(context, page);
      },
      label: Text(_description),
    );
  }

  void push_page(BuildContext context, String page) {
    Navigator.of(context).pushNamed(page);
  }

  SizedBox slider(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.25,
      child: create_pageview(),
    );
  }

  PageView create_pageview() {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return create_container(
          0.25,
          context,
          _descriptions_slider[index],
          _images_slider[index],
          _icons_slider[index],
          _pages[index],
        );
      },
      itemCount: _images_slider.length,
      onPageChanged: (int index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }

  List<Widget> _buildPageIndicator() {
    return List<Widget>.generate(
      _images_slider.length,
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
