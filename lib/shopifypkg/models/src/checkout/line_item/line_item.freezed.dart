// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'line_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LineItem _$LineItemFromJson(Map<String, dynamic> json) {
  return _LineItem.fromJson(json);
}

/// @nodoc
class _$LineItemTearOff {
  const _$LineItemTearOff();

  _LineItem call(
      {required String title,
      required int quantity,
      required List<DiscountAllocations> discountAllocations,
      List<Attribute> customAttributes = const [],
      String? variantId,
      String? id,
      ProductVariantCheckout? variant}) {
    return _LineItem(
      title: title,
      quantity: quantity,
      discountAllocations: discountAllocations,
      customAttributes: customAttributes,
      variantId: variantId,
      id: id,
      variant: variant,
    );
  }

  LineItem fromJson(Map<String, Object?> json) {
    return LineItem.fromJson(json);
  }
}

/// @nodoc
const $LineItem = _$LineItemTearOff();

/// @nodoc
mixin _$LineItem {
  String get title => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  List<DiscountAllocations> get discountAllocations =>
      throw _privateConstructorUsedError;
  List<Attribute> get customAttributes => throw _privateConstructorUsedError;
  String? get variantId => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  ProductVariantCheckout? get variant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineItemCopyWith<LineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineItemCopyWith<$Res> {
  factory $LineItemCopyWith(LineItem value, $Res Function(LineItem) then) =
      _$LineItemCopyWithImpl<$Res>;
  $Res call(
      {String title,
      int quantity,
      List<DiscountAllocations> discountAllocations,
      List<Attribute> customAttributes,
      String? variantId,
      String? id,
      ProductVariantCheckout? variant});

  $ProductVariantCheckoutCopyWith<$Res>? get variant;
}

/// @nodoc
class _$LineItemCopyWithImpl<$Res> implements $LineItemCopyWith<$Res> {
  _$LineItemCopyWithImpl(this._value, this._then);

  final LineItem _value;
  // ignore: unused_field
  final $Res Function(LineItem) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? quantity = freezed,
    Object? discountAllocations = freezed,
    Object? customAttributes = freezed,
    Object? variantId = freezed,
    Object? id = freezed,
    Object? variant = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      discountAllocations: discountAllocations == freezed
          ? _value.discountAllocations
          : discountAllocations // ignore: cast_nullable_to_non_nullable
              as List<DiscountAllocations>,
      customAttributes: customAttributes == freezed
          ? _value.customAttributes
          : customAttributes // ignore: cast_nullable_to_non_nullable
              as List<Attribute>,
      variantId: variantId == freezed
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as ProductVariantCheckout?,
    ));
  }

  @override
  $ProductVariantCheckoutCopyWith<$Res>? get variant {
    if (_value.variant == null) {
      return null;
    }

    return $ProductVariantCheckoutCopyWith<$Res>(_value.variant!, (value) {
      return _then(_value.copyWith(variant: value));
    });
  }
}

/// @nodoc
abstract class _$LineItemCopyWith<$Res> implements $LineItemCopyWith<$Res> {
  factory _$LineItemCopyWith(_LineItem value, $Res Function(_LineItem) then) =
      __$LineItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      int quantity,
      List<DiscountAllocations> discountAllocations,
      List<Attribute> customAttributes,
      String? variantId,
      String? id,
      ProductVariantCheckout? variant});

  @override
  $ProductVariantCheckoutCopyWith<$Res>? get variant;
}

/// @nodoc
class __$LineItemCopyWithImpl<$Res> extends _$LineItemCopyWithImpl<$Res>
    implements _$LineItemCopyWith<$Res> {
  __$LineItemCopyWithImpl(_LineItem _value, $Res Function(_LineItem) _then)
      : super(_value, (v) => _then(v as _LineItem));

  @override
  _LineItem get _value => super._value as _LineItem;

  @override
  $Res call({
    Object? title = freezed,
    Object? quantity = freezed,
    Object? discountAllocations = freezed,
    Object? customAttributes = freezed,
    Object? variantId = freezed,
    Object? id = freezed,
    Object? variant = freezed,
  }) {
    return _then(_LineItem(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      discountAllocations: discountAllocations == freezed
          ? _value.discountAllocations
          : discountAllocations // ignore: cast_nullable_to_non_nullable
              as List<DiscountAllocations>,
      customAttributes: customAttributes == freezed
          ? _value.customAttributes
          : customAttributes // ignore: cast_nullable_to_non_nullable
              as List<Attribute>,
      variantId: variantId == freezed
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as ProductVariantCheckout?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LineItem extends _LineItem {
  _$_LineItem(
      {required this.title,
      required this.quantity,
      required this.discountAllocations,
      this.customAttributes = const [],
      this.variantId,
      this.id,
      this.variant})
      : super._();

  factory _$_LineItem.fromJson(Map<String, dynamic> json) =>
      _$$_LineItemFromJson(json);

  @override
  final String title;
  @override
  final int quantity;
  @override
  final List<DiscountAllocations> discountAllocations;
  @JsonKey()
  @override
  final List<Attribute> customAttributes;
  @override
  final String? variantId;
  @override
  final String? id;
  @override
  final ProductVariantCheckout? variant;

  @override
  String toString() {
    return 'LineItem(title: $title, quantity: $quantity, discountAllocations: $discountAllocations, customAttributes: $customAttributes, variantId: $variantId, id: $id, variant: $variant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LineItem &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality()
                .equals(other.discountAllocations, discountAllocations) &&
            const DeepCollectionEquality()
                .equals(other.customAttributes, customAttributes) &&
            const DeepCollectionEquality().equals(other.variantId, variantId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.variant, variant));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(discountAllocations),
      const DeepCollectionEquality().hash(customAttributes),
      const DeepCollectionEquality().hash(variantId),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(variant));

  @JsonKey(ignore: true)
  @override
  _$LineItemCopyWith<_LineItem> get copyWith =>
      __$LineItemCopyWithImpl<_LineItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LineItemToJson(this);
  }
}

abstract class _LineItem extends LineItem {
  factory _LineItem(
      {required String title,
      required int quantity,
      required List<DiscountAllocations> discountAllocations,
      List<Attribute> customAttributes,
      String? variantId,
      String? id,
      ProductVariantCheckout? variant}) = _$_LineItem;
  _LineItem._() : super._();

  factory _LineItem.fromJson(Map<String, dynamic> json) = _$_LineItem.fromJson;

  @override
  String get title;
  @override
  int get quantity;
  @override
  List<DiscountAllocations> get discountAllocations;
  @override
  List<Attribute> get customAttributes;
  @override
  String? get variantId;
  @override
  String? get id;
  @override
  ProductVariantCheckout? get variant;
  @override
  @JsonKey(ignore: true)
  _$LineItemCopyWith<_LineItem> get copyWith =>
      throw _privateConstructorUsedError;
}
