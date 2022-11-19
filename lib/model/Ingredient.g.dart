// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ingredient.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IngredientCWProxy {
  Ingredient bold(bool? bold);

  Ingredient fromPalmOil(IngredientSpecialPropertyStatus? fromPalmOil);

  Ingredient id(String? id);

  Ingredient ingredients(List<Ingredient>? ingredients);

  Ingredient percent(double? percent);

  Ingredient percentEstimate(double? percentEstimate);

  Ingredient rank(int? rank);

  Ingredient text(String? text);

  Ingredient vegan(IngredientSpecialPropertyStatus? vegan);

  Ingredient vegetarian(IngredientSpecialPropertyStatus? vegetarian);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Ingredient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Ingredient(...).copyWith(id: 12, name: "My name")
  /// ````
  Ingredient call({
    bool? bold,
    IngredientSpecialPropertyStatus? fromPalmOil,
    String? id,
    List<Ingredient>? ingredients,
    double? percent,
    double? percentEstimate,
    int? rank,
    String? text,
    IngredientSpecialPropertyStatus? vegan,
    IngredientSpecialPropertyStatus? vegetarian,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIngredient.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIngredient.copyWith.fieldName(...)`
class _$IngredientCWProxyImpl implements _$IngredientCWProxy {
  final Ingredient _value;

  const _$IngredientCWProxyImpl(this._value);

  @override
  Ingredient bold(bool? bold) => this(bold: bold);

  @override
  Ingredient fromPalmOil(IngredientSpecialPropertyStatus? fromPalmOil) =>
      this(fromPalmOil: fromPalmOil);

  @override
  Ingredient id(String? id) => this(id: id);

  @override
  Ingredient ingredients(List<Ingredient>? ingredients) =>
      this(ingredients: ingredients);

  @override
  Ingredient percent(double? percent) => this(percent: percent);

  @override
  Ingredient percentEstimate(double? percentEstimate) =>
      this(percentEstimate: percentEstimate);

  @override
  Ingredient rank(int? rank) => this(rank: rank);

  @override
  Ingredient text(String? text) => this(text: text);

  @override
  Ingredient vegan(IngredientSpecialPropertyStatus? vegan) =>
      this(vegan: vegan);

  @override
  Ingredient vegetarian(IngredientSpecialPropertyStatus? vegetarian) =>
      this(vegetarian: vegetarian);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Ingredient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Ingredient(...).copyWith(id: 12, name: "My name")
  /// ````
  Ingredient call({
    Object? bold = const $CopyWithPlaceholder(),
    Object? fromPalmOil = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? ingredients = const $CopyWithPlaceholder(),
    Object? percent = const $CopyWithPlaceholder(),
    Object? percentEstimate = const $CopyWithPlaceholder(),
    Object? rank = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
    Object? vegan = const $CopyWithPlaceholder(),
    Object? vegetarian = const $CopyWithPlaceholder(),
  }) {
    return Ingredient(
      bold: bold == const $CopyWithPlaceholder()
          ? _value.bold
          // ignore: cast_nullable_to_non_nullable
          : bold as bool?,
      fromPalmOil: fromPalmOil == const $CopyWithPlaceholder()
          ? _value.fromPalmOil
          // ignore: cast_nullable_to_non_nullable
          : fromPalmOil as IngredientSpecialPropertyStatus?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      ingredients: ingredients == const $CopyWithPlaceholder()
          ? _value.ingredients
          // ignore: cast_nullable_to_non_nullable
          : ingredients as List<Ingredient>?,
      percent: percent == const $CopyWithPlaceholder()
          ? _value.percent
          // ignore: cast_nullable_to_non_nullable
          : percent as double?,
      percentEstimate: percentEstimate == const $CopyWithPlaceholder()
          ? _value.percentEstimate
          // ignore: cast_nullable_to_non_nullable
          : percentEstimate as double?,
      rank: rank == const $CopyWithPlaceholder()
          ? _value.rank
          // ignore: cast_nullable_to_non_nullable
          : rank as int?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
      vegan: vegan == const $CopyWithPlaceholder()
          ? _value.vegan
          // ignore: cast_nullable_to_non_nullable
          : vegan as IngredientSpecialPropertyStatus?,
      vegetarian: vegetarian == const $CopyWithPlaceholder()
          ? _value.vegetarian
          // ignore: cast_nullable_to_non_nullable
          : vegetarian as IngredientSpecialPropertyStatus?,
    );
  }
}

extension $IngredientCopyWith on Ingredient {
  /// Returns a callable class that can be used as follows: `instanceOfIngredient.copyWith(...)` or like so:`instanceOfIngredient.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IngredientCWProxy get copyWith => _$IngredientCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      rank: JsonObject.parseInt(json['rank']),
      id: json['id'] as String?,
      text: json['text'] as String?,
      percent: JsonObject.parseDouble(json['percent']),
      percentEstimate: JsonObject.parseDouble(json['percent_estimate']),
      vegan: ingredientSpecialPropertyStatusFromJson(json['vegan']),
      vegetarian: ingredientSpecialPropertyStatusFromJson(json['vegetarian']),
      fromPalmOil:
          ingredientSpecialPropertyStatusFromJson(json['from_palm_oil']),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      bold: json['bold'] as bool? ?? false,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rank', instance.rank);
  writeNotNull('id', instance.id);
  val['text'] = instance.text;
  writeNotNull('percent', instance.percent);
  writeNotNull('percent_estimate', instance.percentEstimate);
  writeNotNull('vegan', ingredientSpecialPropertyStatusToJson(instance.vegan));
  writeNotNull(
      'vegetarian', ingredientSpecialPropertyStatusToJson(instance.vegetarian));
  writeNotNull('from_palm_oil',
      ingredientSpecialPropertyStatusToJson(instance.fromPalmOil));
  writeNotNull(
      'ingredients', JsonHelper.ingredientsToJson(instance.ingredients));
  val['bold'] = instance.bold;
  return val;
}
