// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderedNutrient.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderedNutrientCWProxy {
  OrderedNutrient displayInEditForm(bool displayInEditForm);

  OrderedNutrient id(String id);

  OrderedNutrient important(bool important);

  OrderedNutrient name(String? name);

  OrderedNutrient subNutrients(List<OrderedNutrient>? subNutrients);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderedNutrient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderedNutrient(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderedNutrient call({
    bool? displayInEditForm,
    String? id,
    bool? important,
    String? name,
    List<OrderedNutrient>? subNutrients,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderedNutrient.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderedNutrient.copyWith.fieldName(...)`
class _$OrderedNutrientCWProxyImpl implements _$OrderedNutrientCWProxy {
  final OrderedNutrient _value;

  const _$OrderedNutrientCWProxyImpl(this._value);

  @override
  OrderedNutrient displayInEditForm(bool displayInEditForm) =>
      this(displayInEditForm: displayInEditForm);

  @override
  OrderedNutrient id(String id) => this(id: id);

  @override
  OrderedNutrient important(bool important) => this(important: important);

  @override
  OrderedNutrient name(String? name) => this(name: name);

  @override
  OrderedNutrient subNutrients(List<OrderedNutrient>? subNutrients) =>
      this(subNutrients: subNutrients);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderedNutrient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderedNutrient(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderedNutrient call({
    Object? displayInEditForm = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? important = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? subNutrients = const $CopyWithPlaceholder(),
  }) {
    return OrderedNutrient(
      displayInEditForm: displayInEditForm == const $CopyWithPlaceholder() ||
              displayInEditForm == null
          ? _value.displayInEditForm
          // ignore: cast_nullable_to_non_nullable
          : displayInEditForm as bool,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      important: important == const $CopyWithPlaceholder() || important == null
          ? _value.important
          // ignore: cast_nullable_to_non_nullable
          : important as bool,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      subNutrients: subNutrients == const $CopyWithPlaceholder()
          ? _value.subNutrients
          // ignore: cast_nullable_to_non_nullable
          : subNutrients as List<OrderedNutrient>?,
    );
  }
}

extension $OrderedNutrientCopyWith on OrderedNutrient {
  /// Returns a callable class that can be used as follows: `instanceOfOrderedNutrient.copyWith(...)` or like so:`instanceOfOrderedNutrient.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderedNutrientCWProxy get copyWith => _$OrderedNutrientCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedNutrient _$OrderedNutrientFromJson(Map<String, dynamic> json) =>
    OrderedNutrient(
      important: json['important'] as bool,
      id: json['id'] as String,
      displayInEditForm: json['display_in_edit_form'] as bool,
      name: json['name'] as String?,
      subNutrients: (json['nutrients'] as List<dynamic>?)
          ?.map((e) => OrderedNutrient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderedNutrientToJson(OrderedNutrient instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['important'] = instance.important;
  val['display_in_edit_form'] = instance.displayInEditForm;
  writeNotNull('nutrients', instance.subNutrients);
  return val;
}
