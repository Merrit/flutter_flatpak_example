import 'dart:io';

import 'package:flutter/material.dart';

enum Toolkit {
  gtk,
  kde,
}

class Flatpak {
  ///
  Future<ThemeMode> themeMode() async {
    ThemeMode? themeMode;
    themeMode = await _themeModeFromActiveTheme(Toolkit.gtk);
    print('gtkTheme: $themeMode');
    themeMode ??= await _themeModeFromActiveTheme(Toolkit.kde);
    print('kdeTheme: $themeMode');
    themeMode ??= ThemeMode.dark;
    return themeMode;
  }

  ///
  Future<ThemeMode?> _themeModeFromActiveTheme(Toolkit toolkit) async {
    const gtkCommand = 'gsettings get org.gnome.desktop.interface gtk-theme';
    const kdeCommand = 'kreadconfig5 --group General --key ColorScheme';
    final command = (toolkit == Toolkit.gtk) ? gtkCommand : kdeCommand;
    final result = await Process.run('bash', ['-c', command]);

    if (result.stderr != '') return null;

    final theme = (result.stdout as String).toLowerCase();

    return (theme.contains('dark')) ? ThemeMode.dark : ThemeMode.light;
  }
}
