import 'package:flutter/material.dart';
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
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              labelText: "6자리 코드",
              labelStyle: TextStyle(color: AppColors.lightGray),
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              viewModel.authCode = value;
              viewModel.notifyListeners();
            },
          ),
          Spacer(),
          BarButton(
            text: "다음",
            isEnabled: viewModel.authCode.isNotEmpty,
            onPressed: viewModel.authCode.isNotEmpty ? viewModel.nextStep : null,
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
