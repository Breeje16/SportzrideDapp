import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sportzride/presentation/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseNotificationSetup().init();
  // FirebaseTokenSetup().init();
  debugPaintSizeEnabled = false;
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  runApp(const MyApp());
}
