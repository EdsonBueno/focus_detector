import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A widget to indicate the user that an error occurred.
class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    Key key,
    this.title,
    this.message,
    this.onActionButtonPressed,
    this.actionButtonText,
  }) : super(key: key);

  final String title;
  final String message;
  final String actionButtonText;
  final VoidCallback onActionButtonPressed;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title ?? 'Error',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, color: Colors.black54),
              ),
              Text(
                message ?? 'An error occurred. Please, try again later!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RaisedButton(
                  onPressed: onActionButtonPressed,
                  child: Text(
                    actionButtonText ?? 'Try Again!',
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
