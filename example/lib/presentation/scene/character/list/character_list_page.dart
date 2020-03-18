import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:focusdetectorexample/data_source.dart';
import 'package:focusdetectorexample/model/character_summary.dart';
import 'package:focusdetectorexample/presentation/common/response_view.dart';
import 'package:focusdetectorexample/presentation/route_name_builder.dart';
import 'package:focusdetectorexample/presentation/scene/character/list/character_list_item.dart';

/// Fetches and displays a list of characters' summarized info.
class CharacterListPage extends StatefulWidget {
  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  /// An object that identifies the currently active Future call. Used to avoid
  /// calling setState under two conditions:
  /// 1 - If this state is already disposed, e.g. if the user left this page
  /// before the Future completion.
  /// 2 - From duplicated Future calls, if somehow we call
  /// _fetchCharacterSummaryList two times in a row.
  Object _activeCallbackIdentity;

  List<CharacterSummary> _characterSummaryList;
  bool _isLoading = true;
  bool _hasError = false;

  // Vital for identifying our FocusDetector when a rebuild occurs.
  final Key resumeDetectorKey = UniqueKey();

  @override
  Widget build(BuildContext context) => FocusDetector(
        key: resumeDetectorKey,
        onFocusGained: _fetchCharacterSummaryList,
        onFocusLost: () {
          print('CharacterListPage lost focus');
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Characters'),
          ),
          body: ResponseView(
            isLoading: _isLoading,
            hasError: _hasError,
            onTryAgainTap: _fetchCharacterSummaryList,
            contentWidgetBuilder: (context) => ListView.builder(
              itemCount: _characterSummaryList.length,
              itemBuilder: (context, index) {
                final character = _characterSummaryList[index];
                return CharacterListItem(
                  character: character,
                  onTap: () {
                    // Detailed tutorial on this:
                    // https://edsonbueno.com/2020/02/26/spotless-routing-and-navigation-in-flutter/
                    Navigator.of(context).pushNamed(
                      RouteNameBuilder.characterById(
                        character.id,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _activeCallbackIdentity = null;
    super.dispose();
  }

  Future<void> _fetchCharacterSummaryList() async {
    setState(() {
      _isLoading = true;
    });

    final callbackIdentity = Object();
    _activeCallbackIdentity = callbackIdentity;

    try {
      final fetchedCharacterList = await DataSource.getCharacterList();
      if (callbackIdentity == _activeCallbackIdentity) {
        setState(() {
          _characterSummaryList = fetchedCharacterList;
          _isLoading = false;
          _hasError = false;
        });
      }
    } on Exception {
      if (callbackIdentity == _activeCallbackIdentity) {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    }
  }
}
