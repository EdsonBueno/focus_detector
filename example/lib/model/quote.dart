import 'package:flutter/foundation.dart';

class Quote {
  Quote({
    @required this.id,
    @required this.text,
    @required this.authorName,
  })  : assert(id != null),
        assert(text != null),
        assert(authorName != null);

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json['quote_id'],
        text: json['quote'],
        authorName: json['author'],
      );

  final int id;
  final String text;
  final String authorName;
}
