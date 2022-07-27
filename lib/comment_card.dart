import 'package:flutter/material.dart';
import 'comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  const CommentCard({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Column(
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(3),
              },
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text('Id:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(comment.id.toString()),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text('User Name:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(comment.name),
                  )
                ]),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text('Email'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(comment.email),
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text('Body:'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                          comment.body),
                    )
                  ],
                ),
                (comment.postId != null)? TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text('postId:'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                          comment.postId.toString()),
                    )
                  ],
                ) : TableRow(children: [Text(''), Text('')])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
