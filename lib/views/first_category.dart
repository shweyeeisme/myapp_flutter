import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class FirstCategory extends StatefulWidget {
  const FirstCategory({super.key});

  @override
  State<FirstCategory> createState() => _FirstCategoryState();
}

class _FirstCategoryState extends State<FirstCategory> {
  String textFromFile = '';

  getData() async {
    String response;
    response = await rootBundle.loadString('text_note/my_text.txt');
    setState(() {
      textFromFile = response;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'First Category',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            // fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: SelectableText(
                    textFromFile,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
