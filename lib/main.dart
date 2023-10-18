import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:musicsync/pages/PlayList.dart';
import 'package:musicsync/pages/PlayMusic.dart';
import 'package:musicsync/splash.dart';
import 'package:musicsync/widgets/PlayList.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:provider/provider.dart';

import 'provider/song_model_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
    create: (context) => SongModelProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const Splash(),
    );
  }
}
