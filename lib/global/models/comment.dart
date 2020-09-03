class CommentModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  CommentModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  static CommentModel fromJson(Map map) {
    return CommentModel(
      body: map['body'],
      email: map['email'],
      id: map['id'],
      name: map['name'],
      postId: map['postId'],
    );
  }

  Map toJson() {
    return {
      'body': body,
      'email': email,
      'id': id,
      'name': name,
      'postId': postId,
    };
  }
}
