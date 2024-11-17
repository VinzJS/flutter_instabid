import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'setting_repository_impl.g.dart';

@Riverpod(keepAlive: true)
SettingRepository settingRepository(Ref ref) {
  return SettingRepositoryImpl(
    storage: ref.read(flutterSecureStorageProvider),
  );
}

const String _settingsKey = 'settings';

class SettingRepositoryImpl implements SettingRepository {
  final FlutterSecureStorage _storage;

  SettingRepositoryImpl({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  @override
  TaskResult<Settings> set({required Settings settings}) {
    return TaskResult.tryCatch(() async {
      _storage.write(key: _settingsKey, value: jsonEncode(settings.toJson()));
      return settings;
    }, Failure.tryCatchData);
  }

  @override
  TaskResult<Settings> get() {
    return TaskResult.tryCatch(() async {
      final result = await _storage.read(key: _settingsKey);

      if (result == null) {
        return const Settings(
          domain: 'https://instabid-bytemee.fly.dev',
        );
      }

      return Settings.fromJson(result);
    }, Failure.tryCatchData);
  }

  @override
  TaskResult<Settings> update({String? domain}) {
    return TaskResult.Do(($) async {
      final settings = await $(get());
      final updated = settings.copyWith(
        domain: domain ?? settings.domain,
      );
      return await $(set(settings: updated));
    });
  }
}
