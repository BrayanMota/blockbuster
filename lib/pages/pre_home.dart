import 'package:blockbuster_system/utils/colors.dart';
import 'package:flutter/material.dart';

import '../apps/production/pages/list.dart';
import 'home.dart';

class PreHomePage extends StatefulWidget {
  const PreHomePage({Key? key}) : super(key: key);

  @override
  State<PreHomePage> createState() => _PreHomePageState();
}

class _PreHomePageState extends State<PreHomePage> {
  late int _indexCurrentPage;

  final _pages = const [
    HomePage(),
    ProductionList(),
  ];

  @override
  void initState() {
    super.initState();
    _indexCurrentPage = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _indexCurrentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_indexCurrentPage],
      bottomNavigationBar: buildCupertinoBar(context),
    );
  }

  Widget buildCupertinoBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _indexCurrentPage,
      onTap: _navigationTapped,
      selectedItemColor: CustomColors.orangeBlockbuster,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_creation_outlined),
          label: 'Produções',
        ),
      ],
    );
  }

  void _navigationTapped(int page) {
    setState(() {
      _indexCurrentPage = page;
    });
  }
}
