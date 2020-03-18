import 'package:flutter/foundation.dart';

/// Complete information about a character.
class CharacterDetail {
  const CharacterDetail({
    @required this.id,
    @required this.name,
    @required this.occupations,
    @required this.pictureUrl,
    @required this.vitalStatus,
    @required this.seasons,
    @required this.nickname,
    @required this.actorName,
  })  : assert(id != null),
        assert(name != null),
        assert(occupations != null),
        assert(pictureUrl != null),
        assert(vitalStatus != null),
        assert(seasons != null),
        assert(nickname != null),
        assert(actorName != null);

  factory CharacterDetail.fromJson(Map<String, dynamic> json) {
    final List<dynamic> occupationJsonArray = json['occupation'];
    final List<dynamic> appearanceJsonArray = json['appearance'];

    return CharacterDetail(
      id: json['char_id'],
      name: json['name'],
      occupations: occupationJsonArray.cast(),
      pictureUrl: json['img'],
      vitalStatus: json['status'],
      seasons: appearanceJsonArray.cast(),
      nickname: json['nickname'],
      actorName: json['portrayed'],
    );
  }

  final int id;
  final String name;
  final List<String> occupations;
  final String pictureUrl;
  final String vitalStatus;
  final List<int> seasons;
  final String nickname;
  final String actorName;
}
