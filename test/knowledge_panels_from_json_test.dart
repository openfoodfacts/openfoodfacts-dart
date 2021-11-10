import 'package:openfoodfacts/model/KnowledgePanels.dart';
import 'package:test/test.dart';

void main() {
  // Verify that we can successfully load the Knowledge panel from a JSON string
  test('Load KP from JSON', () async {
    Map<String, dynamic> panels = {
      'ecoscore': {
        'elements': [
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
            'element_type': 'panel',
            'panel_element': {'panel_id': 'ecoscore_agribalyse'}
          },
          {
            'element_type': 'text',
            'text_element': {
              'html': 'Positive and negative points of this product:'
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
            'panel_element': {'panel_id': 'ecoscore_packaging'}
          },
          {
            'element_type': 'text',
            'text_element': {
              'html': 'Impact for this product: D (Score: 39/100)',
              'type': 'h1'
            }
          }
        ],
        'grade': '',
        'level': 'info',
        'parent_panel_id': 'root',
        'title_element': {
          'icon_url':
              'https://static.openfoodfacts.dev/images/attributes/ecoscore-d.svg',
          'title': 'Eco-Score D - High environmental impact'
        },
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
                          'https://static.openfoodfacts.dev/images/icons/dist/agriculture.svg',
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
                          'https://static.openfoodfacts.dev/images/icons/dist/processing.svg',
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
                          'https://static.openfoodfacts.dev/images/icons/dist/packaging.svg',
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
                          'https://static.openfoodfacts.dev/images/icons/dist/transportation.svg',
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
                          'https://static.openfoodfacts.dev/images/icons/dist/distribution.svg',
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
                          'https://static.openfoodfacts.dev/images/icons/dist/consumption.svg',
                      'text': 'Consumption'
                    },
                    {'percent': 0, 'text': '0.0 %'}
                  ]
                }
              ],
              'type': 'percents',
              'title': 'Details of the impacts by stages of the life cycle'
            }
          }
        ],
        'grade': 'c',
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title_element': {
          'subtitle': 'Category: Chocolate spread with hazelnuts',
          'title':
              'Average impact for products of the same category: C (Score: 40/100)'
        },
        'topics': ['environment'],
        'type': 'score'
      },
      'ecoscore_carbon_impact': {
        'elements': [
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  "\n                    <p>The carbon emission figure comes from ADEME's Agribalyse database, for the category: \n                    <a href='https://agribalyse.ademe.fr/app/aliments/31032'>Chocolate spread with hazelnuts</a>\n                    </p>\n                    ",
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
              'id': 'ecoscore_carbon_impact_by_stages_table',
              'rows': [
                {
                  'id': 'agriculture',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.dev/images/icons/dist/agriculture.svg',
                      'text': 'Agriculture'
                    },
                    {'percent': 88.8889136446762, 'text': '88.9 %'}
                  ]
                },
                {
                  'id': 'processing',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.dev/images/icons/dist/processing.svg',
                      'text': 'Processing'
                    },
                    {'percent': 7.00489485042906, 'text': '7.0 %'}
                  ]
                },
                {
                  'id': 'packaging',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.dev/images/icons/dist/packaging.svg',
                      'text': 'Packaging'
                    },
                    {'percent': 1.9105118864761, 'text': '1.9 %'}
                  ]
                },
                {
                  'id': 'transportation',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.dev/images/icons/dist/transportation.svg',
                      'text': 'Transportation'
                    },
                    {'percent': 1.99595294189039, 'text': '2.0 %'}
                  ]
                },
                {
                  'id': 'distribution',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.dev/images/icons/dist/distribution.svg',
                      'text': 'Distribution'
                    },
                    {'percent': 0.142846509121219, 'text': '0.1 %'}
                  ]
                },
                {
                  'id': 'consumption',
                  'values': [
                    {
                      'icon_url':
                          'https://static.openfoodfacts.dev/images/icons/dist/consumption.svg',
                      'text': 'Consumption'
                    },
                    {'percent': 0, 'text': '0.0 %'}
                  ]
                }
              ],
              'type': 'percents',
              'title': 'Details of the impacts by stages of the life cycle'
            }
          }
        ],
        'evaluation': 'bad',
        'level': 'info',
        'parent_panel_id': 'root',
        'title_element': {
          'icon_color_from_evaluation': true,
          'icon_url':
              'https://static.openfoodfacts.dev/images/icons/dist/car.svg',
          'subtitle': '987 g CO² per 100g of product',
          'title': 'Equal to driving 5.1 km in a petrol car'
        },
        'topics': ['environment'],
        'type': 'score'
      },
      'ecoscore_packaging': {
        'elements': [
          {
            'element_type': 'table',
            'table_element': {
              'columns': [
                {'text': 'Shape', 'type': 'text'},
                {'text': 'Material', 'type': 'text'},
                {'text': 'Recycling', 'type': 'text'},
                {'text': 'Impact', 'type': 'text'}
              ],
              'id': 'ecoscore_packaging_components',
              'rows': [
                {
                  'values': [
                    {'text': '1 Lid'},
                    {'text': 'PP - Polypropylene'},
                    {'evaluation': 'bad', 'text': 'Discard'},
                    {'evaluation': 'bad', 'text': 'High'}
                  ]
                },
                {
                  'values': [
                    {'text': '1 Backing'},
                    {'text': 'Cardboard'},
                    {'evaluation': 'good', 'text': 'Recycle'},
                    {'evaluation': 'good', 'text': 'Low'}
                  ]
                },
                {
                  'values': [
                    {'text': '1 Seal'},
                    {'text': 'Cardboard'},
                    {'evaluation': 'good', 'text': 'Recycle'},
                    {'evaluation': 'good', 'text': 'Low'}
                  ]
                },
                {
                  'values': [
                    {'text': '1 Pot'},
                    {'text': 'Glass'},
                    {'evaluation': 'good', 'text': 'Recycle'},
                    {'evaluation': 'good', 'text': 'Low'}
                  ]
                }
              ],
              'title': 'Packaging parts',
              'type': 'table'
            }
          }
        ],
        'evaluation': 'good',
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title_element': {
          'title':
              "This product's packaging has a low impact on the environment."
        },
        'topics': ['environment'],
        'type': 'score'
      },
      'ecoscore_production_system': {
        'elements': [
          {
            'element_type': 'panel',
            'panel_element': {
              'panel_id': 'environment_label_fr:ab-agriculture-biologique'
            }
          },
          {
            'element_type': 'panel',
            'panel_element': {'panel_id': 'environment_label_en:eu-organic'}
          }
        ],
        'evaluation': 'good',
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title_element': {
          'subtitle': 'AB Agriculture Biologique, EU Organic',
          'title': 'Production mode with high environmental benefits'
        },
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
        'evaluation': 'bad',
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title_element': {'title': ''},
        'topics': ['environment'],
        'type': 'score'
      },
      'environment_label_en:eu-organic': {
        'elements': [
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  '\n                    Organic food is food produced by methods complying with the standards of organic farming and features practices that cycle resources, promote ecological balance, and conserve biodiversity.\n                    ',
              'type': 'default'
            }
          }
        ],
        'evaluation': 'good',
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title_element': {
          'icon_url': '/images/lang/en/labels/eu-organic.135x90.svg',
          'subtitle':
              'Organic agriculture contributes to preserve biodiversity, climate, water quality and soil fertility.',
          'title': 'EU Organic'
        },
        'topics': ['environment'],
        'type': 'doyouknow'
      },
      'environment_label_fr:ab-agriculture-biologique': {
        'elements': [
          {
            'element_type': 'text',
            'text_element': {
              'html':
                  '\n                    Organic food is food produced by methods complying with the standards of organic farming and features practices that cycle resources, promote ecological balance, and conserve biodiversity.\n                    ',
              'type': 'default'
            }
          }
        ],
        'evaluation': 'good',
        'level': 'info',
        'parent_panel_id': 'ecoscore',
        'title_element': {
          'icon_url':
              '/images/lang/fr/labels/ab-agriculture-biologique.74x90.svg',
          'subtitle':
              'Organic agriculture contributes to preserve biodiversity, climate, water quality and soil fertility.',
          'title': 'AB Agriculture Biologique'
        },
        'topics': ['environment'],
        'type': 'doyouknow'
      },
    };
    KnowledgePanels kp = KnowledgePanels.fromJson(panels);
    expect(kp.panelIdToPanelMap.length, equals(8));
  });

  // Verify that one KnowledgePanelElement must have a known KP element.
  test('Unknown Element in JSON', () async {
    Map<String, dynamic> panels = {
      'doyouknow_brands_nutella_423': {
        'parent_panel_id': 'root',
        'type': 'doyouknow',
        'level': 'trivia',
        'topics': ['ingredients'],
        'title_element': {
          'icon_url':
              '/images/lang/fr/labels/ab-agriculture-biologique.74x90.svg',
          'title': 'Do you know why Nutella contains hazelnuts?',
          'subtitle': 'It all started after the second world war...',
        },
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
