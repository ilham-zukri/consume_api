import 'package:consume_api/get_page.dart';
import 'package:consume_api/patch_page.dart';
import 'package:consume_api/post_page.dart';
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
        title: Text('API Consuming'),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const GetPage();
                        },
                      ),
                    );
                  },
                  child: Text('GET'),
                ),
              ),
              Container(
                height: height / 10,
                width: width,
                margin: EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PostPage();
                        },
                      ),
                    );
                  },
                  child: Text('POST'),
                ),
              ),
              Container(
                height: height / 10,
                width: width,
                margin: EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const PatchPage();
                    },));
                  },
                  child: Text('PATCH'),
                ),
              ),
              Container(
                height: height / 10,
                width: width,
                margin: EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('DELETE'),
                ),
              ),
              Container(
                height: height / 10,
                width: width,
                margin: EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('PUT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
