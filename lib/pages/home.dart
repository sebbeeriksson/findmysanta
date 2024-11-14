// lib/pages/home_page.dart
import 'package:findmysanta/data_for_testing/santa_data.dart';
import 'package:findmysanta/models/santa.dart';
import 'package:findmysanta/widgets/santa_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Santa> _santas = generateSantas();
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _loadMoreItems() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        int currentLength = _santas.length;
        _santas.addAll(generateSantas());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find My Santa"),
      ),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          if (index >= _santas.length) {
            _loadMoreItems();
            return Center(child: CircularProgressIndicator());
          }

          return SantaPage(santa: _santas[index]);
        },
        itemCount: _santas.length + 1,
      ),
    );
  }
}
