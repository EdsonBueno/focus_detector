import 'package:flutter/widgets.dart';
import 'package:focusdetectorexample/presentation/common/centered_progress_indicator.dart';
import 'package:focusdetectorexample/presentation/common/error_indicator.dart';

/// Chooses between a [CenteredProgressIndicator], an [ErrorIndicator] or a
/// content widget depending on the passed arguments.
class ResponseView extends StatelessWidget {
  const ResponseView({
    @required this.isLoading,
    @required this.hasError,
    @required this.contentWidgetBuilder,
    this.onTryAgainTap,
    Key key,
  })  : assert(isLoading != null),
        assert(hasError != null),
        assert(contentWidgetBuilder != null),
        super(key: key);

  final bool isLoading;
  final bool hasError;
  final GestureTapCallback onTryAgainTap;
  final WidgetBuilder contentWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CenteredProgressIndicator();
    }

    if (hasError) {
      return ErrorIndicator(
        onActionButtonPressed: onTryAgainTap,
      );
    }

    return contentWidgetBuilder(context);
  }
}
