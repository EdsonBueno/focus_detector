import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focusdetectorexample/model/character_summary.dart';

/// List item representing a single Character with its photo and name.
class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    @required this.character,
    this.onTap,
    Key key,
  })  : assert(character != null),
        super(key: key);

  final CharacterSummary character;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(character.pictureUrl),
        ),
        title: Text(character.name),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      );
}
