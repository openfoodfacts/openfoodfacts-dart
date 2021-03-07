enum UserPreferencesVariableValue {
  NOT_IMPORTANT,
  IMPORTANT,
  VERY_IMPORTANT,
  MANDATORY,
  UNSET
}

extension UserPreferencesVariableValueExtention
    on UserPreferencesVariableValue? {
  String get value {
    switch (this) {
      case UserPreferencesVariableValue.NOT_IMPORTANT:
        return 'not_important';
      case UserPreferencesVariableValue.IMPORTANT:
        return 'important';
      case UserPreferencesVariableValue.VERY_IMPORTANT:
        return 'very_important';
      case UserPreferencesVariableValue.MANDATORY:
        return 'mandatory';
      default:
        return 'unset';
    }
  }

  String get label {
    switch (this) {
      case UserPreferencesVariableValue.NOT_IMPORTANT:
        return 'Not important';
      case UserPreferencesVariableValue.IMPORTANT:
        return 'Important';
      case UserPreferencesVariableValue.VERY_IMPORTANT:
        return 'Very important';
      case UserPreferencesVariableValue.MANDATORY:
        return 'Mandatory';
      default:
        return 'Unset';
    }
  }

  /*Color get color {
    switch (this) {
      case UserPreferencesVariableValue.NOT_IMPORTANT:
        return Colors.black87;
        break;
      case UserPreferencesVariableValue.IMPORTANT:
        return Colors.green.withOpacity(0.87);
        break;
      case UserPreferencesVariableValue.VERY_IMPORTANT:
        return Colors.deepOrangeAccent.withOpacity(0.87);
        break;
      case UserPreferencesVariableValue.MANDATORY:
        return Colors.redAccent.withOpacity(0.87);
        break;
      default:
        return Colors.black26;
        break;
    }
  }*/

  static UserPreferencesVariableValue fromString(String s) {
    switch (s) {
      case 'not_important':
        return UserPreferencesVariableValue.NOT_IMPORTANT;
      case 'important':
        return UserPreferencesVariableValue.IMPORTANT;
      case 'very_important':
        return UserPreferencesVariableValue.VERY_IMPORTANT;
      case 'mandatory':
        return UserPreferencesVariableValue.MANDATORY;
      default:
        return UserPreferencesVariableValue.UNSET;
    }
  }
}

enum UserPreferencesVariable {
  VEGAN,
  VEGETARIAN,
  GLUTEN_FREE,
  ORGANIC_LABELS,
  FAIR_TRADE_LABELS,
  PALM_FREE_LABELS,
  ADDITIVES,
  NOVA_GROUP,
  NUTRI_SCORE
}

extension UserPreferencesVariableExtension on UserPreferencesVariable {
  String get name {
    switch (this) {
      case UserPreferencesVariable.VEGAN:
        return 'Vegan';
      case UserPreferencesVariable.VEGETARIAN:
        return 'Vegetarian';
      case UserPreferencesVariable.GLUTEN_FREE:
        return 'Gluten Free';
      case UserPreferencesVariable.ORGANIC_LABELS:
        return 'Organic labels';
      case UserPreferencesVariable.FAIR_TRADE_LABELS:
        return 'Fair trade labels';
      case UserPreferencesVariable.PALM_FREE_LABELS:
        return 'Palm free labels';
      case UserPreferencesVariable.ADDITIVES:
        return 'Additives';
      case UserPreferencesVariable.NOVA_GROUP:
        return 'NOVA Group';
      case UserPreferencesVariable.NUTRI_SCORE:
        return 'Nutri-Score';
      default:
        return 'Accountable variables';
    }
  }

  static List<UserPreferencesVariable> getMandatoryVariables() {
    return <UserPreferencesVariable>[
      UserPreferencesVariable.VEGAN,
      UserPreferencesVariable.VEGETARIAN,
      //UserPreferencesVariable.GLUTEN_FREE
    ];
  }

  static List<UserPreferencesVariable> getAccountableVariables() {
    return <UserPreferencesVariable>[
      UserPreferencesVariable.ORGANIC_LABELS,
      UserPreferencesVariable.FAIR_TRADE_LABELS,
      UserPreferencesVariable.PALM_FREE_LABELS,
      UserPreferencesVariable.ADDITIVES,
      UserPreferencesVariable.NOVA_GROUP,
      UserPreferencesVariable.NUTRI_SCORE
    ];
  }

  static List<UserPreferencesVariable> getVariables() {
    return <UserPreferencesVariable>[
      UserPreferencesVariable.VEGAN,
      UserPreferencesVariable.VEGETARIAN,
      UserPreferencesVariable.GLUTEN_FREE,
      UserPreferencesVariable.ORGANIC_LABELS,
      UserPreferencesVariable.FAIR_TRADE_LABELS,
      UserPreferencesVariable.PALM_FREE_LABELS,
      UserPreferencesVariable.ADDITIVES,
      UserPreferencesVariable.NOVA_GROUP,
      UserPreferencesVariable.NUTRI_SCORE
    ];
  }
}

class UserPreferences {
  UserPreferences() {
    for (final UserPreferencesVariable variable
        in UserPreferencesVariable.values) {
      setVariable(variable, UserPreferencesVariableValue.NOT_IMPORTANT);
    }
  }

  UserPreferences.filled(Map<String, dynamic> data) {
    loadJson(data);
  }

  UserPreferencesVariableValue? _vegan;
  UserPreferencesVariableValue? _vegetarian;
  UserPreferencesVariableValue? _glutenFree;

  UserPreferencesVariableValue? _organicLabels;
  UserPreferencesVariableValue? _fairTradeLabels;
  UserPreferencesVariableValue? _palmFreeLabels;
  UserPreferencesVariableValue? _additives;
  UserPreferencesVariableValue? _novaGroup;
  UserPreferencesVariableValue? _nutriScore;

  void setVariable(
      UserPreferencesVariable variable, UserPreferencesVariableValue value) {
    switch (variable) {
      case UserPreferencesVariable.VEGAN:
        _vegan = value;
        break;
      case UserPreferencesVariable.VEGETARIAN:
        _vegetarian = value;
        break;
      case UserPreferencesVariable.GLUTEN_FREE:
        _glutenFree = value;
        break;
      case UserPreferencesVariable.ORGANIC_LABELS:
        _organicLabels = value;
        break;
      case UserPreferencesVariable.FAIR_TRADE_LABELS:
        _fairTradeLabels = value;
        break;
      case UserPreferencesVariable.PALM_FREE_LABELS:
        _palmFreeLabels = value;
        break;
      case UserPreferencesVariable.ADDITIVES:
        _additives = value;
        break;
      case UserPreferencesVariable.NOVA_GROUP:
        _novaGroup = value;
        break;
      case UserPreferencesVariable.NUTRI_SCORE:
        _nutriScore = value;
        break;
    }
  }

  UserPreferencesVariableValue? getVariable(UserPreferencesVariable variable) {
    switch (variable) {
      case UserPreferencesVariable.VEGAN:
        return _vegan;
      case UserPreferencesVariable.VEGETARIAN:
        return _vegetarian;
      case UserPreferencesVariable.GLUTEN_FREE:
        return _glutenFree;
      case UserPreferencesVariable.ORGANIC_LABELS:
        return _organicLabels;
      case UserPreferencesVariable.FAIR_TRADE_LABELS:
        return _fairTradeLabels;
      case UserPreferencesVariable.PALM_FREE_LABELS:
        return _palmFreeLabels;
      case UserPreferencesVariable.ADDITIVES:
        return _additives;
      case UserPreferencesVariable.NOVA_GROUP:
        return _novaGroup;
      case UserPreferencesVariable.NUTRI_SCORE:
        return _nutriScore;
      default:
        return null;
    }
  }

  List<UserPreferencesVariable> getActiveVariables() {
    final List<UserPreferencesVariable> result = <UserPreferencesVariable>[];
    for (final UserPreferencesVariable variable
        in UserPreferencesVariable.values) {
      if (getVariable(variable) != UserPreferencesVariableValue.NOT_IMPORTANT) {
        result.add(variable);
      }
    }
    return result;
  }

  void loadJson(Map<String, dynamic> data) {
    for (final UserPreferencesVariable variable
        in UserPreferencesVariable.values) {
      if (data[variable.name] is! int) {
        setVariable(variable, UserPreferencesVariableValue.NOT_IMPORTANT);
      } else {
        setVariable(
            variable,
            UserPreferencesVariableValueExtention.fromString(
                data[variable.name] as String? ?? 'unset'));
      }
    }
  }

  Map<String, String> toJson() {
    final Map<String, String> result = <String, String>{};

    for (final UserPreferencesVariable variable
        in UserPreferencesVariable.values) {
      result[variable.name] = getVariable(variable).value;
    }

    return result;
  }
}
