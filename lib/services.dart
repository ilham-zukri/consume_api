import 'comment.dart';
import 'package:dio/dio.dart';
abstract class Services {
  static const String path ="https://jsonplaceholder.typicode.com/comments/";
  static Future<Comment?> getById(int id) async {
    try{
      var response = await Dio().get(path+id.toString());
      if(response.statusCode == 200){
        return Comment(id: response.data['id'], name: response.data['name'], email: response.data['email'], body: response.data['body']);
      }
      return null;
    }
    catch(e){
      throw Exception(e.toString());
    };
  }
  static Future<Comment?> createComment(
      int postId, String name, String email, String body) async {
    try{
      var response = await Dio().post(path, data: {
        'postId':postId,
        'name':name,
        'email':email,
        'body':body
      });
      if(response.statusCode == 200){
        return Comment(id: response.data['id'], name: response.data['name'], email: response.data['email'], body: response.data['body'],postId: response.data['postId']);
      }
      return null;
    }
    catch(e){

    }
  }
}
