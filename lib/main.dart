import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'doc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD0P6vBn--njXpOfwWu_uAeXFPyxxVMKYE",
          appId: "1:863825700345:android:e5af0bfb474cf5b38ac928",
          messagingSenderId: "863825700345",
          projectId: "app-2ff2e"));
  setupGetIt();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
