import 'package:consume_api/comment.dart';
import 'package:consume_api/services.dart';
import 'package:flutter/material.dart';
import 'comment_card.dart';

class PatchPage extends StatefulWidget {
  const PatchPage({Key? key}) : super(key: key);

  @override
  State<PatchPage> createState() => _PatchPageState();
}

class _PatchPageState extends State<PatchPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  Comment? comment;

  void clearInput() {
    idController.clear();
    nameController.clear();
    emailController.clear();
    bodyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('PATCH_PAGE'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: (comment != null)
                ? CommentCard(comment: comment!)
                : const Text('waiting for response......'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height / 2.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.3)),
                    BoxShadow(
                        color: Colors.white.withOpacity(1),
                        spreadRadius: -2,
                        offset: const Offset(-20, 0),
                        blurRadius: 3),
                  ],
                  border: Border.all(color: Colors.blue),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 15,
                        child: TextField(
                          controller: idController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            labelText: 'Id',
                            labelStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                          onChanged: (content) async{
                            Comment? result = await Services.getById(int.parse(idController.text));
                            if(result != null){
                              setState(() {
                                comment = result;
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        height: height / 15,
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              labelText: 'Name',
                              labelStyle: const TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14)),
                        ),
                      ),
                      Container(
                        height: height / 15,
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14)),
                        ),
                      ),
                      Container(
                        height: height / 10,
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        child: TextField(
                          maxLines: 200,
                          keyboardType: TextInputType.multiline,
                          controller: bodyController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            var result;
                            if (nameController.text.isNotEmpty) {
                              result = await Services.patchComment(
                                  int.parse(idController.text),
                                  name: nameController.text.toString());
                            } else if (emailController.text.isNotEmpty) {
                              result = await Services.patchComment(
                                  int.parse(idController.text),
                                  email: emailController.text.toString());
                            } else if (bodyController.text.isNotEmpty) {
                              result = await Services.patchComment(
                                  int.parse(idController.text),
                                  body: bodyController.text.toString()) ;
                            }

                            if (result != null) {
                              setState(() {
                                comment = result ;
                                clearInput();
                              });
                            }
                          },
                          child: Text('PATCH'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
