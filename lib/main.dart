import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:place/domain/repositories/auth_repository.dart';
import 'package:place/presentation/blocs/auth/auth_cubit.dart';

import 'app.dart'; // Import your main app widget
import 'firebase_options.dart'; // Firebase options
import 'injector.dart'; // Dependency injection setup

final _logger = Logger('MyApp');
final sl = GetIt.instance;

void main() async {
  await initApp();
  runApp(const App());
}

Future<void> initApp() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: 'assets/dotenv.env');
    await initFirebase();
    configureDependencies(Environment.prod);

    // Register the AuthCubit after configuring dependencies
    sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl<AuthRepository>()));
  } catch (e) {
    _logger.severe('Error during app initialization: $e');
    rethrow; // Rethrow the error to crash the app, as it's not in a usable state
  }
}

Future<void> initFirebase() async {
  if (Firebase.apps.isEmpty) {
    try {
      await Firebase.initializeApp(
        name: "place",
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _logger.info('Firebase initialized successfully');
    } catch (e) {
      _logger.severe('Firebase initialization error: $e');
      rethrow;
    }
  } else {
    _logger.info('Firebase is already initialized');
  }
}
