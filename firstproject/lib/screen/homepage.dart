import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? title;
  int counter = 0;
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  double total = 0;
  @override
  void initState() {
    title = "Welcome to Home Page";
    number1.text = "0";
    number2.text = "0";
    super.initState();
  }

  void handleAddition() {
    setState(() {
      total = double.parse(number1.text) + double.parse(number2.text);
    });
  }

  void handlebuttonClick() {
    setState(() {
      counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text(title!)),
          Center(child: Text('$counter')),
          ElevatedButton(
            onPressed: () {
              handlebuttonClick();
            },
            child: Text("Counter"),
          ),

          SizedBox(height: 20),
          TextField(controller: number1),
          SizedBox(height: 20),
          TextField(controller: number2),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              handleAddition();
            },
            child: Text("Addition"),
          ),
          SizedBox(height: 20),
          Center(child: Text("$total")),
        ],
      ),
    );
  }
}
