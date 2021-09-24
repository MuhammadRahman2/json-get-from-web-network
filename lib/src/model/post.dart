import 'dart:convert';

class PostList {
  final List<Post>? posts;

  PostList({
    this.posts,
  });

  factory PostList.fromJson(List<dynamic> parsedjson) {
    List<Post> posts = <Post>[];
    posts = parsedjson.map((i) => Post.fromMap(i)).toList();
    return PostList(posts: posts);
  }
  // Map<dynamic>
}

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'userId': userId,
  //     'id': id,
  //     'title': title,
  //     'body': body,
  //   };
  // }

  // Post copyWith({
  //   int? userId,
  //   int? id,
  //   String? title,
  //   String? body,
  // }) {
  //   return Post(
  //     userId: userId ?? this.userId,
  //     id: id ?? this.id,
  //     title: title ?? this.title,
  //     body: body ?? this.body,
  //   );
  // }

//   String toJson() => json.encode(toMap());

//   factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Post(userId: $userId, id: $id, title: $title, body: $body)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Post &&
//       other.userId == userId &&
//       other.id == id &&
//       other.title == title &&
//       other.body == body;
//   }

//   @override
//   int get hashCode {
//     return userId.hashCode ^
//       id.hashCode ^
//       title.hashCode ^
//       body.hashCode;
//   }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}
