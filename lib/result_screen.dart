import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_provider.dart';

class ResultScreen extends StatefulWidget {
  final String text;
  const ResultScreen({super.key, required this.text,});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (_, model, child) => Scaffold(
        backgroundColor:  model.isRed ? Colors.red : Colors.yellow,
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text(widget.text),
              GestureDetector(
                onTap: (){
                  model.change();
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
