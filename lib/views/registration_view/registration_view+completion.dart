import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/registration_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../share/app_color.dart';
import '../../widgets/bar_button.dart';

class Completion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegistrationViewModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // PNG 이미지를 사용하여 파티 팝퍼 표시
          Image.asset(
            'assets/party_popper.png', // PNG 이미지 경로
            width: 100, // 이미지 너비
            height: 100, // 이미지 높이
          ),
          SizedBox(height: 24),
          Text(
            "인증에 성공했습니다!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "함께하기 전에 몇 가지만 알려주시면 \n 서비스 이용에 도움드릴 수 있어요",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          BarButton(
            isEnabled: true,
            text: "1분만에 프로필 설정하기",
            onPressed: () async {
              try {
                // Firebase Authentication 익명 로그인
                final auth = FirebaseAuth.instance;
                final userCredential = await auth.signInAnonymously();

                final uid = userCredential.user?.uid; // Firebase Authentication에서 UID 가져오기
                if (uid != null) {
                  print("생성된 UID: $uid");

                  // Firestore에 기본 데이터 저장
                  await viewModel.register(uid);

                  // TODO: 성공 후 프로필 설정 화면으로 이동
                  // Navigator.pushReplacementNamed(context, '/profile');
                } else {
                  throw Exception("UID 생성 실패");
                }
              } catch (e) {
                // 오류 처리
                print("Firebase Authentication 오류: ${e.toString()}");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("오류 발생: ${e.toString()}"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            enabledColor: AppColors.lightGreen,
            disabledColor: AppColors.darkGreen,
            enabledTextColor: AppColors.black,
            disabledTextColor: AppColors.black,
          ),
        ],
      ),
    );
  }
}
