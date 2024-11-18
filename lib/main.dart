import 'package:flutter/material.dart';
import 'views/registration_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyBOFSlP1DkVAkycAVjQLOUTvVMevPzCOPU",
          authDomain: "rep-f-8b018.firebaseapp.com",
          projectId: "rep-f-8b018",
          storageBucket: "rep-f-8b018.appspot.com",
          messagingSenderId: "300527337363",
          appId: "1:300527337363:web:cbfef119f8a6c8e8b7f266",
          measurementId: "G-RENHEJS44F",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
    print('Firebase 초기화 성공');
  } catch (e) {
    print('Firebase 초기화 실패: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '회원가입',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  RegistrationView(), // 초기 화면을 RegistrationView로 설정
    );
  }
}
