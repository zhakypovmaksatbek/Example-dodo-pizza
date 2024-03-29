import 'package:example/presentation/provider/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final class InitialMain {
  static Widget initial(Widget child) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => StateProvider()),
    ], child: child);
  }
}
