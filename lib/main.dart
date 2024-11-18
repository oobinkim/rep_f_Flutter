import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/registration_view.dart';
import 'views/splash_view.dart';
import 'viewmodels/splash_viewmodel.dart';
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
      // iOS와 Android 환경은 기본 설정 사용
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
      ],
      child: MaterialApp(
        title: 'Rep : f',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashView(),
          '/registration': (context) => RegistrationView(),
        },
      ),
    );
  }
}
