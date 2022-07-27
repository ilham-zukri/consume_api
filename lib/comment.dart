class Comment {
  int? id;
  int? postId;
  String name;
  String email;
  String body;

  Comment({required this.id, required this.name, required this.email, required this.body, this.postId});

}