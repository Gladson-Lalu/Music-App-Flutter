import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gd_music/models/section.dart';

class NetworkMusic {
  static List<Section> _albumSections = [];
  Future<List<Section>> get albumSections async {
    List<String> _jsonList = [
      "assets/json/discover.json",
      "assets/json/made_for_you.json"
    ];
    if (_albumSections.isEmpty) {
      for (String json in _jsonList) {
        Map<String, dynamic> _source =
            jsonDecode(await rootBundle.loadString(json));
        _albumSections.add(Section.fromJson(_source));
      }
    }
    return _albumSections;
  }
}
