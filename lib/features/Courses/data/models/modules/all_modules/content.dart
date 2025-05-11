import 'package:equatable/equatable.dart';

class Content extends Equatable {
  final int? id;
  final String? title;
  final String? url;
  final dynamic text;
  final String? contentType;

  const Content({this.id, this.title, this.url, this.text, this.contentType});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json['id'] as int?,
    title: json['title'] as String?,
    url: json['url'] as String?,
    text: json['text'] as dynamic,
    contentType: json['contentType'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'url': url,
    'text': text,
    'contentType': contentType,
  };

  @override
  List<Object?> get props => [id, title, url, text, contentType];
}
