import 'package:flutter/widgets.dart';

/// Shows a bold label followed by a description text, useful for displaying
/// structured simple text info.
class LabeledText extends StatelessWidget {
  const LabeledText({
    @required this.label,
    this.description,
    this.horizontalAndBottomPadding = 8,
    Key key,
  })  : assert(label != null),
        super(key: key);
  final String label;
  final String description;
  final double horizontalAndBottomPadding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            left: horizontalAndBottomPadding,
            right: horizontalAndBottomPadding,
            bottom: horizontalAndBottomPadding),
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '$label: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: description),
            ],
          ),
        ),
      );
}
