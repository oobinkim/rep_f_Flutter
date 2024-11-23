import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/registration_viewmodel.dart';
import '../../share/app_color.dart';

class Step4Completion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.celebration, size: 100, color: AppColors.lightGreen),
          SizedBox(height: 24),
          Text(
            "인증에 성공했습니다!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "함께하기 전에 몇 가지만 알려주시면 서비스 이용에 도움이 됩니다.",
            style: TextStyle(fontSize: 16, color: AppColors.lightGray),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48),
              backgroundColor: AppColors.lightGreen,
              foregroundColor: AppColors.black,
            ),
            child: Text("1분만에 프로필 설정하기"),
          ),
        ],
      ),
    );
  }
}
