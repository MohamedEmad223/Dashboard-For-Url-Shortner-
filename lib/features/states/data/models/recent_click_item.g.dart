// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_click_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentClickItem _$RecentClickItemFromJson(Map<String, dynamic> json) =>
    RecentClickItem(
      id: (json['id'] as num).toInt(),
      linkId: (json['link_id'] as num).toInt(),
      country: json['country'] as String?,
      city: json['city'] as String?,
      deviceType: json['device_type'] as String?,
      browser: json['browser'] as String?,
      platform: json['platform'] as String?,
      createdAt: json['created_at'] as String,
      link: RecentClickLink.fromJson(json['link'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentClickItemToJson(RecentClickItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link_id': instance.linkId,
      'country': instance.country,
      'city': instance.city,
      'device_type': instance.deviceType,
      'browser': instance.browser,
      'platform': instance.platform,
      'created_at': instance.createdAt,
      'link': instance.link,
    };
