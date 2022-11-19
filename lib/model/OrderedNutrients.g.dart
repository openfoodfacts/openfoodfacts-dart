// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderedNutrients.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderedNutrientsCWProxy {
  OrderedNutrients nutrients(List<OrderedNutrient> nutrients);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderedNutrients(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderedNutrients(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderedNutrients call({
    List<OrderedNutrient>? nutrients,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderedNutrients.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderedNutrients.copyWith.fieldName(...)`
class _$OrderedNutrientsCWProxyImpl implements _$OrderedNutrientsCWProxy {
  final OrderedNutrients _value;

  const _$OrderedNutrientsCWProxyImpl(this._value);

  @override
  OrderedNutrients nutrients(List<OrderedNutrient> nutrients) =>
      this(nutrients: nutrients);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderedNutrients(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderedNutrients(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderedNutrients call({
    Object? nutrients = const $CopyWithPlaceholder(),
  }) {
    return OrderedNutrients(
      nutrients: nutrients == const $CopyWithPlaceholder() || nutrients == null
          ? _value.nutrients
          // ignore: cast_nullable_to_non_nullable
          : nutrients as List<OrderedNutrient>,
    );
  }
}

extension $OrderedNutrientsCopyWith on OrderedNutrients {
  /// Returns a callable class that can be used as follows: `instanceOfOrderedNutrients.copyWith(...)` or like so:`instanceOfOrderedNutrients.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderedNutrientsCWProxy get copyWith => _$OrderedNutrientsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedNutrients _$OrderedNutrientsFromJson(Map<String, dynamic> json) =>
    OrderedNutrients(
      nutrients: (json['nutrients'] as List<dynamic>)
          .map((e) => OrderedNutrient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderedNutrientsToJson(OrderedNutrients instance) =>
    <String, dynamic>{
      'nutrients': instance.nutrients,
    };
