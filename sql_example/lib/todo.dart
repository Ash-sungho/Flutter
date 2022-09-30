class Todo {
  Todo({this.title, this.content, this.active, this.id});

  String? title;
  String? content;
  int? active;
  int? id;

  Map<String, dynamic> tomap() {
    return {
      'title': this.title,
      'content': this.content,
      'active': this.active,
      'id': this.id,
    };
  }
}
