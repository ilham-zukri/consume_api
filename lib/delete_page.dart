import 'package:consume_api/comment.dart';
import 'package:consume_api/comment_card.dart';
import 'package:consume_api/services.dart';
import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  Comment? comment;
  bool? isDeleted = false;
  String message = 'waiting for response.......';
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DELETE_PAGE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              (comment != null)
                  ? CommentCard(comment: comment!)
                  : Text(message),
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                ),
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
                  onChanged: (content) async{
                    Comment? result =
                        await Services.getById(int.parse(idController.text));
                    if (result != null) {
                      setState(() {
                        comment = result;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    isDeleted = await Services.deleteComment(int.parse(idController.text));
                    idController.clear();
                    setState((){
                      message = (isDeleted!) ? 'id : ${comment!.id} has been deleted' : 'Delete Failed';
                      comment = null;
                    });
                  },
                  child: Text('DELETE'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
