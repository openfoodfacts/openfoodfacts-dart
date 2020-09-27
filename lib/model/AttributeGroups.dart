import 'dart:convert';

enum AttributeGroup { NUTRITIONAL_QUALITY, PROCESSING, LABELS, UNKNOWN }

extension AttributeGroupExtension on AttributeGroup {
  String get id {
    switch (this) {
      case AttributeGroup.NUTRITIONAL_QUALITY:
        return 'nutritional_quality';
        break;
      case AttributeGroup.PROCESSING:
        return 'processing';
        break;
      case AttributeGroup.LABELS:
        return 'labels';
        break;
      default:
        return 'unknown';
        break;
    }
  }

  static AttributeGroup groupFromString(String s) {
    switch (s) {
      case 'nutritional_quality':
        return AttributeGroup.NUTRITIONAL_QUALITY;
        break;
      case 'processing':
        return AttributeGroup.PROCESSING;
        break;
      case 'labels':
        return AttributeGroup.LABELS;
        break;
      default:
        return AttributeGroup.UNKNOWN;
        break;
    }
  }
}

class AttributeGroups {
  Map<AttributeGroup, List<Attribute>> groups;
  Map<AttributeGroup, String> groupNames;

  AttributeGroups(this.groups, this.groupNames);

  static AttributeGroups fromJson(List<dynamic> json) {
    if (json == null) {
      return null;
    }

    Map<AttributeGroup, List<Attribute>> result =
        Map<AttributeGroup, List<Attribute>>();
    Map<AttributeGroup, String> resultNames = Map<AttributeGroup, String>();

    for (Map<String, dynamic> groupData in json) {
      AttributeGroup group =
          AttributeGroupExtension.groupFromString(groupData['id']);
      result[group] = List<Attribute>();
      resultNames[group] = groupData['name'];

      for (Map<String, dynamic> attribute in groupData['attributes']) {
        result[group].add(Attribute(
            id: attribute['id'],
            name: attribute['name'],
            title: attribute['title'],
            settingName: attribute['setting_name'],
            settingNote: attribute['setting_note'],
            match: double.parse(attribute['match'].toString()),
            description: attribute['description'],
            shortDescription: attribute['description_short'],
            status: attribute['status']));
      }
    }

    return AttributeGroups(result, resultNames);
  }

  static List<Map<String, dynamic>> toJson(AttributeGroups attributeGroups) {
    if (attributeGroups == null) {
      return null;
    }

    List<Map<String, dynamic>> result = List<Map<String, dynamic>>();
    for (AttributeGroup ag in AttributeGroup.values) {
      List<Map<String, dynamic>> attributes = List<Map<String, dynamic>>();
      for (Attribute a in attributeGroups.groups[ag]) {
        attributes.add(a.toJson());
      }
      result.add({
        'id': ag.id,
        'name': attributeGroups.groupNames[ag],
        'attributes': attributes
      });
    }
    return result;
  }
}

class Attribute {
  String id;
  String name;
  String title;
  String settingName;
  String settingNote;
  double match;
  String description;
  String shortDescription;
  String status;

  Attribute(
      {this.id,
      this.name,
      this.title,
      this.settingName,
      this.settingNote,
      this.match,
      this.description,
      this.shortDescription,
      this.status});

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'title': this.title,
      'setting_name': this.settingName,
      'setting_note': this.settingNote,
      'match': this.match,
      'description': this.description,
      'description_short': this.shortDescription,
      'status': this.status
    };
  }
}
