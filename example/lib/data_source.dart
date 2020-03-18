import 'dart:convert';
import 'dart:io';

import 'package:focusdetectorexample/model/character_detail.dart';
import 'package:focusdetectorexample/model/character_summary.dart';
import 'package:focusdetectorexample/model/quote.dart';
import 'package:http/http.dart' as http;

/// Communicates with the Breaking Bad API.
// I kept it as simple as possible to avoid taking the focus off the
// article's point.
class DataSource {
  static Future<List<CharacterSummary>> getCharacterList() async => http
      .get(
        _ApiUrlBuilder.characterList(),
      )
      .mapFromResponse(
        (jsonArray) => _parseItemListFromJsonArray(
          jsonArray,
          (jsonObject) => CharacterSummary.fromJson(jsonObject),
        ),
      );

  static Future<CharacterDetail> getCharacterDetail(
      {String name, int id}) async {
    assert(name != null || id != null);
    return http
        .get(
          id != null
              ? _ApiUrlBuilder.characterById(id)
              : _ApiUrlBuilder.characterByName(name),
        )
        .mapFromResponse(
          (jsonArray) => _parseSingleItemFromJsonArray(
            jsonArray,
            (jsonObject) => CharacterDetail.fromJson(jsonObject),
          ),
        );
  }

  static Future<List<Quote>> getQuoteList() async => http
      .get(
        _ApiUrlBuilder.quoteList(),
      )
      .mapFromResponse(
        (jsonArray) => _parseItemListFromJsonArray(
          jsonArray,
          (jsonObject) => Quote.fromJson(jsonObject),
        ),
      );

  // The API gives us an array of one element when requesting a character by id.
  static T _parseSingleItemFromJsonArray<T>(
    List<dynamic> jsonArray,
    T Function(dynamic object) mapper,
  ) =>
      jsonArray.map(mapper).toList().first;

  static List<T> _parseItemListFromJsonArray<T>(
    List<dynamic> jsonArray,
    T Function(dynamic object) mapper,
  ) =>
      jsonArray.map(mapper).toList();
}

class GenericHttpException implements Exception {}

/// Builds our APIs endpoints.
class _ApiUrlBuilder {
  static const _baseUrl = 'https://www.breakingbadapi.com/api/';
  static const _charactersResource = 'characters/';
  static const _quotesResource = 'quotes/';

  static String characterList() => '$_baseUrl$_charactersResource?'
      'category=Breaking+Bad';

  static String characterById(int id) => '$_baseUrl$_charactersResource$id';

  static String characterByName(String name) => '$_baseUrl$_charactersResource?'
      // The API expects us to encode our query string arguments with '+'
      // instead of spacing.
      'name=${name.replaceAll(' ', '+')}';

  static String quoteList() => '$_baseUrl$_quotesResource?'
      'series=Breaking+Bad';
}

extension on Future<http.Response> {
  Future<R> mapFromResponse<R, T>(R Function(T) jsonParser) async {
    try {
      final response = await this;
      if (response.statusCode == 200) {
        return jsonParser(jsonDecode(response.body));
      } else {
        throw GenericHttpException();
      }
    } on SocketException {
      throw GenericHttpException();
    }
  }
}
