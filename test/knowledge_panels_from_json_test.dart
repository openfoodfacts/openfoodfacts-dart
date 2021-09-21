import 'dart:convert';

import 'package:openfoodfacts/model/KnowledgePanel.dart';
import 'package:openfoodfacts/model/KnowledgePanels.dart';
import 'package:test/test.dart';

void main() {
  // Verify that we can successfully load the Knowledge panel from a JSON string
  test('Load KP from JSON', () async {
    Map<String, dynamic> panels = {
      'ecoscore': {
        'elements': [
          {
            'element_type': 'image',
            'image_element': {
              'alt': 'Eco-score e',
              'height': 130,
              'link_title': 'Information about the Eco-score',
              'link_url':
                  'https://uk.openfoodfacts.org/eco-score-the-environmental-impact-of-food-products',
              'url':
                  'https://static.openfoodfacts.org/images/icons/ecoscore-e.svg',
              'width': 274
            }
          },
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  'The <a href=\'/ecoscore\'>Eco-Score</a> is an experimental score that summarizes the environmental impacts of food products.'
            }
          },
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  '\n                    \n                        The Eco-Score was initially developped for France and it is being extended to other European countries. The Eco-Score formula is subject to change as it is regularly improved to make it more precise and better suited to each country.\n                                    \n                ',
              'type': 'note'
            }
          },
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  'Average impact of products of the Chocolate spread with hazelnuts category: C (Score: 40/100)',
              'type': 'h1'
            }
          },
          {
            'element_type': 'panel',
            'panel_element': {'panel_id': 'ecoscore_agribalyse'}
          },
          {
            'element_type': 'text',
            'text_element': {
              'html': 'Impact for this product: E (Score: 10/100)',
              'type': 'h1'
            }
          },
          {
            'element_type': 'panel',
            'panel_element': {'panel_id': 'ecoscore_production_system'}
          },
          {
            'element_type': 'panel',
            'panel_element': {'panel_id': 'ecoscore_origins_of_ingredients'}
          },
          {
            'element_type': 'panel',
            'panel_element': {'panel_id': 'ecoscore_threatened_species'}
          },
          {
            'element_type': 'panel',
            'panel_element': {'panel_id': 'ecoscore_packaging'}
          },
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  '<p>The <a href=\'/ecoscore\'>Eco-Score</a> is an experimental score that summarizes the environmental impacts of food products.</p>',
              'type': 'warning'
            }
          }
        ],
        'grade': '',
        'icon_url':
            'https://static.openfoodfacts.org/images/attributes/ecoscore-e.svg',
        'level': 'info',
        'parent_panel_id': 'root',
        'title': 'Eco-Score E - Very high environmental impact',
        'topics': ['environment'],
        'type': 'score'
      },
      'ecoscore_agribalyse': {
        'elements': [
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  '\n                    <p>Agribalyse category: \n                    <a href=\'https://www.ecoscore_data.agribalyse.fr/app/aliments/31032\'>Chocolate spread with hazelnuts</a>\n                    </p>\n                    <ul>\n                        <li>\n                            PEF environmental score: 0.74\n                            (the lower the score, the lower the impact)\n                        </li>\n                        <li>\n                            including impact on climate change: 9.87\n                            kg CO2 eq/kg of product\n                        </li>\n                    </ul>\n                    ',
              'text_type': 'summary'
            }
          },
          {
            'element_type': 'table',
            'table_element': {
              'columns': [
                {'text': 'Stage', 'type': 'text'},
                {'text': 'Impact', 'type': 'percent'}
              ],
              'id': 'ecoscore_lca_impacts_by_stages_table',
              'rows': [
                {
                  'id': 'agriculture',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.org/images/icons/dist/agriculture.svg',
                      'text': 'Agriculture'
                    },
                    {'percent': 82.6683253659907, 'text': '82.7 %'}
                  ]
                },
                {
                  'id': 'processing',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.org/images/icons/dist/processing.svg',
                      'text': 'Processing'
                    },
                    {'percent': 11.5205649227182, 'text': '11.5 %'}
                  ]
                },
                {
                  'id': 'packaging',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.org/images/icons/dist/packaging.svg',
                      'text': 'Packaging'
                    },
                    {'percent': 2.75038601617178, 'text': '2.8 %'}
                  ]
                },
                {
                  'id': 'transportation',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.org/images/icons/dist/transportation.svg',
                      'text': 'Transportation'
                    },
                    {'percent': 2.39678556140912, 'text': '2.4 %'}
                  ]
                },
                {
                  'id': 'distribution',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.org/images/icons/dist/distribution.svg',
                      'text': 'Distribution'
                    },
                    {'percent': 0.617299532560963, 'text': '0.6 %'}
                  ]
                },
                {
                  'id': 'consumption',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.org/images/icons/dist/consumption.svg',
                      'text': 'Consumption'
                    },
                    {'percent': 0, 'text': '0.0 %'}
                  ]
                }
              ],
              'table_type': 'percents',
              'title': 'Details of the impacts by stages of the life cycle'
            }
          }
        ],
        'grade': 'c',
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title':
            'Environmental impact on average for products of the same category',
        'topics': ['environment'],
        'type': 'score'
      },
      'ecoscore_origins_of_ingredients': {
        'elements': [
          {
            'element_type': 'table',
            'table_element': {
              'columns': [
                {'text': 'Origin', 'type': 'text'},
                {'text': '% of ingredients', 'type': 'percent'},
                {'text': 'Impact', 'type': 'text'}
              ],
              'id': 'ecoscore_origins_of_ingredients_table',
              'rows': [
                {
                  'values': [
                    {'text': 'Unknown'},
                    {'evaluation': 'bad', 'percent': 100, 'text': '100 %'},
                    {'evaluation': 'bad', 'text': 'High'}
                  ]
                }
              ],
              'table_type': 'percents',
              'title': 'Origins of ingredients'
            }
          }
        ],
        'evaluation': 'bad',
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title':
            'Transportation and origins of ingredients have a high impact.',
        'topics': ['environment'],
        'type': 'score'
      },
      'ecoscore_packaging': {
        'elements': [
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  '\n                    The information about the packaging of this product is not filled in.\n                    ',
              'type': 'warning'
            }
          },
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  '\n                For a more precise calculation of the Eco-Score, you can modify the product page and add them.\n                <br><br>\n                If you are the manufacturer of this product, you can send us the information with our <a href=\'https://world.pro.openfoodfacts.org\'>free platform for producers</a>.\n                    ',
              'type': 'warning'
            }
          }
        ],
        'evaluation': 'unknown',
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title': "The information about this product's packaging is missing.",
        'topics': ['environment'],
        'type': 'score'
      },
      'ecoscore_production_system': {
        'elements': [
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  '\n                    <p>[give more details here]</p> \n                    ',
              'text_type': 'summary'
            }
          }
        ],
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title': '',
        'topics': ['environment'],
        'type': 'score'
      },
      'ecoscore_threatened_species': {
        'elements': [
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  '\n                    <p>[give more details here]</p> \n                    ',
              'text_type': 'summary'
            }
          }
        ],
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title': '',
        'topics': ['environment'],
        'type': 'score'
      },
      'tags_brands_nutella_doyouknow': {
        'elements': [
          {
            'element': {
              'html':
                  'Cocoa beans were expensive and hard to come by after the second world war, so in Piedmont (Italy) where Pietro Ferrero created Nutella, they were replaced with hazelnuts to make <em>gianduja</em>, a mix of hazelnut paste and chocolate.',
              'text_type': 'default'
            },
            'element_type': 'text'
          },
          {
            'element': {
              'height': 192,
              'url':
                  'https://static.openfoodfacts.org/images/attributes/contains-nuts.png',
              'width': 192
            },
            'element_type': 'image'
          }
        ],
        'level': 'trivia',
        'parent_panel_id': 'root',
        'subtitle': 'It all started after the second world war...',
        'title': 'Do you know why Nutella contains hazelnuts?',
        'topics': ['ingredients'],
        'type': 'doyouknow'
      }
    };
    KnowledgePanels kp = KnowledgePanels.fromJson(panels);
    expect(kp.panelIdToPanelMap.length, equals(7));
  });

  // Verify that one KnowledgePanelElement must have a known KP element.
  test('Unknown Element in JSON', () async {
    Map<String, dynamic> panels = {
      'doyouknow_brands_nutella_423': {
        'parent_panel_id': 'root',
        'type': 'doyouknow',
        'level': 'trivia',
        'topics': ['ingredients'],
        'title': 'Do you know why Nutella contains hazelnuts?',
        'subtitle': 'It all started after the second world war...',
        'elements': [
          {
            'element_type': 'unknown',
            'element': {
              'text_type': 'summary',
              'html':
                  'Cocoa beans were expensive and hard to come by after the second world war, so in Piedmont (Italy) where Pietro Ferrero created Nutella, they were replaced with hazelnuts to make <em>gianduja</em>, a mix of hazelnut paste and chocolate.'
            }
          }
        ]
      },
    };
    expect(() => KnowledgePanels.fromJson(panels), throwsArgumentError);
  });
}
