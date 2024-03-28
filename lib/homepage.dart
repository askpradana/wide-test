import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> items = {};

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      items = data;
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/images/bg.svg",
          semanticsLabel: 'background image',
        ),
        items.isNotEmpty
            ? Scaffold(
                backgroundColor: Colors.transparent,
                body: SizedBox(
                  width: double.infinity,
                  // height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Text(items['namaPerusahaan']),
                      const SizedBox(height: 40),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'Good Afternoon, '),
                            TextSpan(
                              text: items['username'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(text: '!'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Wrap(
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
                      )
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              )
      ],
    );
  }
}

class SingleMenuIcon extends StatelessWidget {
  const SingleMenuIcon({
    super.key,
    required this.text,
    required this.image,
    required this.color,
  });

  final String text;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: color,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(
              "assets/images/icon/$image",
              semanticsLabel: 'background image',
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 60,
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
