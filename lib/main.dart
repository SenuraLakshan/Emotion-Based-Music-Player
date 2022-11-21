import 'package:emotion_based_music_player/Pages/EmotionDetectionPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

import 'Pages/HomePage.dart';
import 'Pages/PlayListPage.dart';
import 'Pages/PlayMusicPage.dart';
import 'Pages/SongPage.dart';

List<CameraDescription>? cameras;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Emotion Based Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmotionDetection(),
      getPages: [
        GetPage(name: '/', page: ()=> const HomePage()),
        GetPage(name: '/song', page: ()=> const MusicPage()),
        GetPage(name: '/playlist', page: ()=> const PlayListScreen()),
        GetPage(name: '/EmotionDetection', page: ()=> const MusicPage()),


      ],
    );
  }
}

