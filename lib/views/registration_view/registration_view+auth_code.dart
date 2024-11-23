import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/registration_viewmodel.dart';
import '../../widgets/bar_button.dart';
import '../../share/app_color.dart';

class Step3AuthCode extends StatelessWidget {
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
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              hintText: "6자리 코드",
              hintStyle: TextStyle(color: AppColors.hintGray),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGreen),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGreen),
              ),
            ),
            cursorColor: AppColors.lightGreen, // 커서 색상
            style: TextStyle(color: AppColors.white), // 입력 텍스트 색상
            keyboardType: TextInputType.number, // 숫자 키보드
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // 숫자만 입력 허용
              LengthLimitingTextInputFormatter(6), // 최대 입력 길이 6자리 제한
            ],
            onChanged: (value) {
              viewModel.authCode = value;
              viewModel.notifyListeners();
            },
          ),
          Spacer(),
          BarButton(
            text: "다음",
            isEnabled: viewModel.authCode.length == 6, // 인증번호가 6자리일 때 활성화
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
