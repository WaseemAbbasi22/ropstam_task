
class Post {
  int ?userId;
  int? id;
  String? title;
  String? body;


  Post({this.id, this.title, this.body, this.userId});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}