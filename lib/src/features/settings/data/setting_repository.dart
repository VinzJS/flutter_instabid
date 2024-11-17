import 'package:instabid/src/_index.dart';

abstract class SettingRepository {
  /// Gets the current settings from the repository.
  TaskResult<Settings> get();

  /// Updates the settings in the repository.
  TaskResult<Settings> set({required Settings settings});

  TaskResult<Settings> update({String? domain});
}
