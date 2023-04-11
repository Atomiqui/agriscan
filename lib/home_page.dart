import 'dart:async';
import 'package:agriscan/lavouras.dart';
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
  final List<String> _images = [
    'assets/images/relatorios.jpg',
    'assets/images/mapa.webp',
    'assets/images/lavoura.jpg',
  ];

  final List<String> _text = [
    'Meus Relatórios',
    'Minhas Demarcações',
    'Minhas Lavouras',
  ];

  final List<Icon> _icons = [
    const Icon(Icons.assessment),
    const Icon(Icons.map),
    const Icon(Icons.agriculture_outlined),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentPage = (_currentPage + 1) % _images.length;
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

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
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
          Center(
            child: SizedBox(
              width: width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Image.asset('assets/logo/logo.png'),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9E9E9E),
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            _images[index],
                          ),
                        ),
                      ),
                      child: TextButton.icon(
                        icon: _icons[index],
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          alignment: Alignment.bottomLeft,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        label: Text(_text[index]),
                      ),
                    );
                  },
                  itemCount: _images.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ],
          ),
          Container(
            width: width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: const Color(0xFF9E9E9E),
              borderRadius: BorderRadius.circular(20.0),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/clima2.avif'),
              ),
            ),
            child: TextButton.icon(
              icon: const Icon(Icons.cloudy_snowing),
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                alignment: Alignment.bottomLeft,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Lavouras(),
                ));
              },
              label: const Text('Clima'),
            ),
          ),
          Container(
            width: width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: const Color(0xFF9E9E9E),
              borderRadius: BorderRadius.circular(20.0),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/clima2.avif'),
              ),
            ),
            child: TextButton.icon(
              icon: const Icon(Icons.cloudy_snowing),
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                alignment: Alignment.bottomLeft,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              label: const Text('Clima'),
            ),
          ),
          Container(
            width: width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: const Color(0xFF9E9E9E),
              borderRadius: BorderRadius.circular(20.0),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/clima2.avif'),
              ),
            ),
            child: TextButton.icon(
              icon: const Icon(Icons.cloudy_snowing),
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                alignment: Alignment.bottomLeft,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              label: const Text('Clima'),
            ),
          ),
          Container(
            width: width,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Lavouras()),
                );
              },
              child: null,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  List<Widget> _buildPageIndicator() {
    return List<Widget>.generate(
      _images.length,
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
