import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('API Consuimng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height / 10,
                width: width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('GET'),
                ),
              ),Container(
                height: height / 10,
                width: width,
                margin: EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('POST'),
                ),
              ),Container(
                height: height / 10,
                width: width,
                margin: EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('UPDATE'),
                ),
              ),Container(
                height: height / 10,
                width: width,
                margin: EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('DELETE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
