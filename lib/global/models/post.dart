class PostModel {
  final int id;
  final int userId;
  final String title;
  String photoUrl;
  final String body;

  PostModel({
    this.id,
    this.title,
    this.photoUrl,
    this.body,
    this.userId,
  });

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'photoUrl': photoUrl,
      'body': body,
      'userId': userId,
    };
  }

  static PostModel fromJson(Map map) {
    return PostModel(
      id: map['id'],
      photoUrl: map['photoUrl'],
      body: map['body'],
      title: map['title'],
      userId: map['userId'],
    );
  }
}
