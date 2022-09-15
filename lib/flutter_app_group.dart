import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAppGroup {
  static const MethodChannel _channel = MethodChannel('flutter_app_group');

  /// Set app group ID for iOS
  /// setAppGroup
  /// Developers must invoke this function to set the [appGroup] before invoking other functions.
  static Future<void> setAppGroup(String appGroup) async {
    await _channel.invokeMethod('setAppGroup', {'appGroup': appGroup});
  }

  /// Saves a boolean [value] to persistent storage under the specified app group.
  /// setBool
  /// If [value] is null, this is equivalent to calling [remove()] on the [key].
  static Future<void> setBool(String key, bool? value) async {
    await _setValue('Bool', key, value);
  }

  /// Saves an integer [value] to persistent storage under the specified app group.
  /// setInt
  /// If [value] is null, this is equivalent to calling [remove()] on the [key].
  static Future<void> setInt(String key, int? value) async {
    await _setValue('Int', key, value);
  }

  /// Saves a double [value] to persistent storage under the specified app group.
  /// setDouble
  /// If [value] is null, this is equivalent to calling [remove()] on the [key].
  static Future<void> setDouble(String key, double? value) async {
    await _setValue('Double', key, value);
  }

  /// Saves a string [value] to persistent storage under the specified app group.
  /// setString
  /// If [value] is null, this is equivalent to calling [remove()] on the [key].
  static Future<void> setString(String key, String? value) async {
    await _setValue('String', key, value);
  }

  /// Saves a Map [value] to persistent storage under the specified app group.
  /// setMap
  /// If [value] is null, this is equivalent to calling [remove()] on the [key].
  static Future<void> setMap(String key, Map? value) async {
    await _setValue('Map', key, value);
  }

  /// Reads a value of any type from persistent storage under the specified app group.
  /// get
  /// If the persistent storage does not contains [key], then [null] will be returned
  static Future<dynamic> get(String key) async {
    return await _channel.invokeMethod('get', {'key': key});
  }

  /// Removes an entry from persistent storage under the specified app group.
  /// remove
  static Future<void> remove(String key) async {
    await _channel.invokeMethod('remove', {'key': key});
  }

  static Future<void> _setValue(
      String valueType, String key, Object? value) async {
    if (value == null) {
      remove(key);
    } else {
      await _channel.invokeMethod('set$valueType', {
        'key': key,
        'value': value,
      });
    }
  }
}
