import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/profile_viewmodel.dart';
import '../../services/registration_services/profile_services.dart';
import '../../share/app_color.dart';
import '../../widgets/bar_button.dart';

class CompletionStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.black, // 배경색
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 이모지
            Image.asset(
              'assets/images/clap.png', // PNG 이미지 경로
              width: 100, // 이미지 너비
              height: 100, // 이미지 높이
            ),
            SizedBox(height: 37),
            // 메인 텍스트
            Text(
              viewModel.selectedPurpose == "브리더/업체"
                  ? "'${viewModel.NickName}'님은 \n'${viewModel.selectedSpecies}' 전문\n '브리더/업체'네요!"
                  : "'${viewModel.personalName}'님, 환영합니다!",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                height: 1.1,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),

            // 서브 텍스트
            Text(
              "당신을 알려주셔서 감사해요.\n이제 랩프를 이용해볼까요!",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 52),

            // 시작하기 버튼 (BarButton)
            BarButton(
              text: "시작하기!",
              isEnabled: true, // 버튼 항상 활성화
              onPressed: () async {
                try {
                  await ProfileService().saveProfile(viewModel); // 프로필 저장
                  Navigator.pushReplacementNamed(context, "/home"); // 메인 화면으로 이동
                } catch (e) {
                  print("데이터 저장 중 오류 발생: $e");
                }
              },
              enabledColor: AppColors.lightGreen,
              disabledColor: AppColors.darkGreen,
              enabledTextColor: AppColors.black,
              disabledTextColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
