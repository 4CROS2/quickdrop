import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/firebase_options.dart';
import 'package:quickdrop/src/prensentation/app/app.dart';
import 'package:quickdrop/src/injection/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const App());
}
