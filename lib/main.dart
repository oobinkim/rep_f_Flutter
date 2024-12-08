import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/agreement_view.dart';
import 'views/splash_view.dart';
import 'views/register_reptile_view/register_reptile_view.dart';
import 'views/profile_view/profile_view.dart';
import 'views/home_view/home_view.dart';
import 'views/registration_view/registration_view.dart';
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
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          fontFamily: 'Pretendard',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: Colors.black, // 기본 배경색
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashView(),
          '/agreement': (context) => AgreementView(),
          '/registration': (context) => RegistrationView(),
          '/profile': (context) => ProfileView(),
          '/home': (context) => HomeView(),
          '/register_reptile': (context) => RegisterReptileView(),
        },
      ),
    );
  }
}
