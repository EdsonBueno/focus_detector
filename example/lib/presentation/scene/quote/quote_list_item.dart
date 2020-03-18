import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focusdetectorexample/model/quote.dart';

/// List item representing a single Quote with its text and author name.
class QuoteListItem extends StatelessWidget {
  const QuoteListItem({
    @required this.quote,
    this.onAuthorNameTap,
    Key key,
  })  : assert(quote != null),
        super(key: key);

  final Quote quote;
  final GestureTapCallback onAuthorNameTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
        child: Column(
          children: <Widget>[
            Text('"${quote.text}"'),
            FlatButton(
              onPressed: onAuthorNameTap,
              child: Text(
                '${quote.authorName}',
                style: TextStyle(
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
