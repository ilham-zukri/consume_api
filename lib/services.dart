import 'comment.dart';
import 'package:dio/dio.dart';

abstract class Services {
  static const String path = "https://jsonplaceholder.typicode.com/comments/";

  static Future<Comment?> getById(int id) async {
    try {
      var response = await Dio().get(path + id.toString());
      if (response.statusCode == 200) {
        return Comment(
            id: response.data['id'],
            name: response.data['name'],
            email: response.data['email'],
            body: response.data['body']);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Comment?> createComment(
      int postId, String name, String email, String body) async {
    try {
      var response = await Dio().post(path,
          data: {'postId': postId, 'name': name, 'email': email, 'body': body});
      if (response.statusCode == 201) {
        return Comment(
            id: response.data['id'],
            name: response.data['name'],
            email: response.data['email'],
            body: response.data['body'],
            postId: response.data['postId']);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Comment?> patchComment(int id,
      {String? name, String? email, String? body}) async {
    try {
      var response;
      if (name != null) {
        response = await Dio().patch(path+id.toString(), data: {
          'name': name,
        });
      } else if (email != null) {
        response = await Dio().patch(path+id.toString(), data: {
          'email': email,
        });
      } else if (body != null) {
        response = await Dio().patch(path+id.toString(), data: {
          'body': body,
        });
      }
      if (response.statusCode == 200) {
        return Comment(
            id: response.data['id'],
            name: response.data['name'],
            email: response.data['email'],
            body: response.data['body']);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
