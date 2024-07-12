import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_senddata/color_provider.dart';
import 'package:test_senddata/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorProvider>(
      create: (BuildContext context) {
        return ColorProvider();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  bool isTrue = true;

  int a = 5;

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (_, model, child) => Scaffold(
        backgroundColor: model.isRed ? Colors.red : Colors.yellow,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("title ${a++}"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "Input",
                    hintStyle: TextStyle(color: Color(0xFF6C757D)),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    model.change();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(DialogRoute(
              context: context,
              builder: (context) => ResultScreen(
                text: textEditingController.text,
              ),
            ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
