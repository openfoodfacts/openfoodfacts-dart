import 'dart:convert';

import 'package:openfoodfacts/model/KnowledgePanel.dart';
import 'package:test/test.dart';

void main() {
  // Verify that we can successfully load the Knowledge panel from a JSON string
  test('Load KP from JSON', () async {
    Map<String, dynamic> ecoScorePanel = {
      'id': 'kp_generic',
      'topics': ['Environment'],
      'title': 'Limos',
      'subtitle': 'Goddess of hunger',
      'grade': 'D',
      'icon_url': 'url',
      'level': 'TRIVIA',
      'elements': [
        {
          'element_style': 'CONTINUOUS',
          'description_unit': {
            'html': '<p>Goddess of hunger</p>',
            'type': 'SUMMARY'
          },
        },
        {
          'element_style': 'CONTINUOUS',
          'image_unit': {
            'url': 'http://visual_depiction_of_hunger.com/image.jpg',
          },
        }
      ]
    };
    String encodedJson = jsonEncode(ecoScorePanel);
    assert(encodedJson is String);
    final Map<String, dynamic> decodedJson =
        json.decode(encodedJson) as Map<String, dynamic>;
    KnowledgePanel kp = KnowledgePanel.fromJson(decodedJson);
    expect(kp.level, equals(Level.TRIVIA));
  });

  // Verify that one KnowledgePanelElement can only have one element at max.
  test('Multiple KP Elements in JSON', () async {
    Map<String, dynamic> ecoScorePanel = {
      'id': 'kp_generic',
      'topics': ['Environment'],
      'title': 'Limos',
      'subtitle': 'Goddess of hunger',
      'grade': 'D',
      'icon_url': 'url',
      'level': 'TRIVIA',
      'elements': [
        {
          'element_style': 'CONTINUOUS',
          'description_unit': {
            'html': '<p>Goddess of hunger</p>',
            'type': 'SUMMARY'
          },
          'image_unit': {
            'url': 'https://static.openfoodfacts.org/images/attributes/no-peanuts.svg',
          },
        }
      ]
    };
    String encodedJson = jsonEncode(ecoScorePanel);
    assert(encodedJson is String);
    final Map<String, dynamic> decodedJson =
        json.decode(encodedJson) as Map<String, dynamic>;
    expect(() => KnowledgePanel.fromJson(decodedJson), throwsFormatException);
  });

  // Verify that one KnowledgePanelElement must have at least one element.
  test('No KP Element in JSON', () async {
    Map<String, dynamic> ecoScorePanel = {
      'id': 'kp_generic',
      'topics': ['Environment'],
      'title': 'Limos',
      'subtitle': 'Goddess of hunger',
      'grade': 'D',
      'icon_url': 'url',
      'level': 'TRIVIA',
      'elements': [
        {
          'element_style': 'CONTINUOUS',
        }
      ]
    };
    String encodedJson = jsonEncode(ecoScorePanel);
    assert(encodedJson is String);
    final Map<String, dynamic> decodedJson =
        json.decode(encodedJson) as Map<String, dynamic>;
    expect(() => KnowledgePanel.fromJson(decodedJson), throwsFormatException);
  });
}
