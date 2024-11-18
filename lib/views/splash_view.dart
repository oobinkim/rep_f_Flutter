import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.microtask(() =>
        Provider.of<SplashViewModel>(context, listen: false).navigateToNextScreen(context));

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/logo.png', // 이미지 경로
          width: screenSize.width, // 화면의 가로 크기
          height: screenSize.height, // 화면의 세로 크기
          fit: BoxFit.cover, // 이미지를 화면에 꽉 채움
        ),
      ),
    );
  }
}
