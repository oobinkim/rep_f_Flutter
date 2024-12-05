import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For inputFormatters
import 'package:provider/provider.dart';
import '../../viewmodels/registration_viewmodel.dart';
import '../../widgets/bar_button.dart';
import '../../share/app_color.dart';

class AuthCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegistrationViewModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "인증번호를 입력해주세요",
            style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ),
          SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              hintText: "6자리 코드", // 플레이스홀더 텍스트
              hintStyle: TextStyle(color: AppColors.hintGray,
              fontWeight: FontWeight.w500), // 플레이스홀더 색상
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGreen), // 활성화된 상태에서 밑줄 색상
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGreen), // 포커스된 상태에서 밑줄 색상
              ),
            ),
            cursorColor: AppColors.lightGreen, // 커서 색상
            style: TextStyle(color: AppColors.white,
            fontWeight: FontWeight.w500), // 입력 텍스트 색상
            keyboardType: TextInputType.number, // 숫자 전용 키보드
            inputFormatters: [
              LengthLimitingTextInputFormatter(6), // 6글자 제한
              FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
            ],
            onChanged: (value) {
              viewModel.authCode = value;
              viewModel.notifyListeners();
            },
          ),
          Spacer(),
          BarButton(
            text: "다음",
            isEnabled: viewModel.authCode.length == 6, // 인증번호가 6자리일 때만 활성화
            onPressed: viewModel.authCode.length == 6 ? viewModel.nextStep : null,
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
