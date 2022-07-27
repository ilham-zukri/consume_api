import 'package:consume_api/comment.dart';
import 'package:consume_api/comment_card.dart';
import 'package:consume_api/services.dart';
import 'package:flutter/material.dart';

class GetPage extends StatefulWidget {
  const GetPage({Key? key}) : super(key: key);

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  Comment? comment;
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Get_Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              (comment != null) ? CommentCard(comment: comment!) : Text('no data'),
              Container(
                margin: EdgeInsets.only(top: 8,),
                width: 75,
                height: 75,
                child: TextField(
                  controller: idController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'id',
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: ElevatedButton(onPressed: () async{
                  Comment? result = await Services.getById(int.parse(idController.text));
                  if(result != null){
                    setState(() {
                      comment = result;
                    });
                  }
                },
                child: Text('GET'),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
