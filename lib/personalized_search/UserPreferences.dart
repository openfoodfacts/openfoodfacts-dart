enum UserPreferencesVariableValue {
  NOT_IMPORTANT,
  IMPORTANT,
  VERY_IMPORTANT,
  MANDATORY,
  UNSET
}

extension UserPreferencesVariableValueExtention
    on UserPreferencesVariableValue {
  String get value {
    switch (this) {
      case UserPreferencesVariableValue.NOT_IMPORTANT:
        return 'not_important';
        break;
      case UserPreferencesVariableValue.IMPORTANT:
        return 'important';
        break;
      case UserPreferencesVariableValue.VERY_IMPORTANT:
        return 'very_important';
        break;
      case UserPreferencesVariableValue.MANDATORY:
        return 'mandatory';
        break;
      default:
        return 'unset';
        break;
    }
  }

  String get label {
    switch (this) {
      case UserPreferencesVariableValue.NOT_IMPORTANT:
        return 'Not important';
        break;
      case UserPreferencesVariableValue.IMPORTANT:
        return 'Important';
        break;
      case UserPreferencesVariableValue.VERY_IMPORTANT:
        return 'Very important';
        break;
      case UserPreferencesVariableValue.MANDATORY:
        return 'Mandatory';
        break;
      default:
        return 'Unset';
        break;
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
        break;
      case 'important':
        return UserPreferencesVariableValue.IMPORTANT;
        break;
      case 'very_important':
        return UserPreferencesVariableValue.VERY_IMPORTANT;
        break;
      case 'mandatory':
        return UserPreferencesVariableValue.MANDATORY;
        break;
      default:
        return UserPreferencesVariableValue.UNSET;
        break;
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
        break;
      case UserPreferencesVariable.VEGETARIAN:
        return 'Vegetarian';
        break;
      case UserPreferencesVariable.GLUTEN_FREE:
        return 'Gluten Free';
        break;
      case UserPreferencesVariable.ORGANIC_LABELS:
        return 'Organic labels';
        break;
      case UserPreferencesVariable.FAIR_TRADE_LABELS:
        return 'Fair trade labels';
        break;
      case UserPreferencesVariable.PALM_FREE_LABELS:
        return 'Palm free labels';
        break;
      case UserPreferencesVariable.ADDITIVES:
        return 'Additives';
        break;
      case UserPreferencesVariable.NOVA_GROUP:
        return 'NOVA Group';
        break;
      case UserPreferencesVariable.NUTRI_SCORE:
        return 'Nutri-Score';
        break;
      default:
        return 'Accountable variables';
        break;
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

  UserPreferencesVariableValue _vegan;
  UserPreferencesVariableValue _vegetarian;
  UserPreferencesVariableValue _glutenFree;

  UserPreferencesVariableValue _organicLabels;
  UserPreferencesVariableValue _fairTradeLabels;
  UserPreferencesVariableValue _palmFreeLabels;
  UserPreferencesVariableValue _additives;
  UserPreferencesVariableValue _novaGroup;
  UserPreferencesVariableValue _nutriScore;

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

  UserPreferencesVariableValue getVariable(UserPreferencesVariable variable) {
    switch (variable) {
      case UserPreferencesVariable.VEGAN:
        return _vegan;
        break;
      case UserPreferencesVariable.VEGETARIAN:
        return _vegetarian;
        break;
      case UserPreferencesVariable.GLUTEN_FREE:
        return _glutenFree;
        break;
      case UserPreferencesVariable.ORGANIC_LABELS:
        return _organicLabels;
        break;
      case UserPreferencesVariable.FAIR_TRADE_LABELS:
        return _fairTradeLabels;
        break;
      case UserPreferencesVariable.PALM_FREE_LABELS:
        return _palmFreeLabels;
        break;
      case UserPreferencesVariable.ADDITIVES:
        return _additives;
        break;
      case UserPreferencesVariable.NOVA_GROUP:
        return _novaGroup;
        break;
      case UserPreferencesVariable.NUTRI_SCORE:
        return _nutriScore;
        break;
      default:
        return null;
        break;
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
                data[variable.name] as String ?? 'unset'));
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
