// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelModel _$PixelModelFromJson(Map<String, dynamic> json) => PixelModel(
      offset: const OffsetConverter()
          .fromJson(json['offset'] as Map<String, dynamic>),
      color: const ColorConverter()
          .fromJson(json['color'] as Map<String, dynamic>),
      uuid: json['uuid'] as String,
      createdAt: const DateTimeConverter()
          .fromJson((json['createdAt'] as num).toInt()),
    );

Map<String, dynamic> _$PixelModelToJson(PixelModel instance) =>
    <String, dynamic>{
      'offset': const OffsetConverter().toJson(instance.offset),
      'color': const ColorConverter().toJson(instance.color),
      'uuid': instance.uuid,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
