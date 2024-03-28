import 'package:flutter/material.dart';
import 'package:wide_test/widget/singlemenuicon.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    super.key,
    required this.items,
  });

  final Map<String, dynamic> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 40),
          Center(
            child: Text(
              items['namaPerusahaan'],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 60),
          Center(
            child: Text.rich(
              style: const TextStyle(color: Colors.blue, fontSize: 22),
              TextSpan(
                children: [
                  const TextSpan(text: 'Good Afternoon, '),
                  TextSpan(
                    text: items['username'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: '!'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Wrap(
              spacing: 8,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: List.generate(
                items['menu'].length,
                (index) => SingleMenuIcon(
                  color: Colors.black,
                  text: items['menu'][index]['title'],
                  image: items['menu'][index]['icon'],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            items['subtitle1'],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            items['subtitle2'],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
