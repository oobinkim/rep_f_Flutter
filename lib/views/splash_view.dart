import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/splash_viewmodel.dart';
import '../share/app_color.dart';
import '../widgets/bar_button.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SplashViewModel의 showButtonsAfterDelay 호출
    Future.microtask(() =>
        Provider.of<SplashViewModel>(context, listen: false).showButtonsAfterDelay());

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 로고 이미지
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: screenSize.width,
              height: screenSize.height,
              fit: BoxFit.cover,
            ),
          ),
          // 버튼 레이어
          Align(
            alignment: Alignment.bottomCenter,
            child: Consumer<SplashViewModel>(
              builder: (context, viewModel, child) {
                return AnimatedOpacity(
                  opacity: viewModel.showButtons ? 1.0 : 0.0, // showButtons에 따라 투명도 변경
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 시작하기 버튼
                        BarButton(
                          text: "시작하기",
                          isEnabled: true,
                          onPressed: () =>
                              viewModel.navigateToAgreement(context),
                          enabledColor: AppColors.lightGreen,
                          disabledColor: AppColors.lightGreen,
                          enabledTextColor: AppColors.black,
                          disabledTextColor: AppColors.black,
                        ),
                        const SizedBox(height: 16),
                        // 구글로 시작하기 버튼
                        BarButton(
                          text: "Google로 시작하기",
                          isEnabled: true,
                          onPressed: () {
                            // TODO: 구글 로그인 추가하기
                          },
                          enabledColor: AppColors.white,
                          disabledColor: AppColors.white,
                          enabledTextColor: AppColors.black,
                          disabledTextColor: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
