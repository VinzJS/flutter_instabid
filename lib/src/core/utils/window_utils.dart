import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';
import 'package:window_manager/window_manager.dart';

class WindowUtils {

  static Future<void> register() async {
   
    if (kIsWeb || !Platform.isWindows) return;

    // * Initialize the WindowManager
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      title: AppStrings.appName,
      minimumSize: Size(380, 700),
      size: Size(380, 700),
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
    );
    // * Wait until the window is ready be shown
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
