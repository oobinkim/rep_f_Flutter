import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/profile_viewmodel.dart';
import '../../share/app_color.dart';
import '../../widgets/bar_button.dart';
import '../../widgets/outlined_textField.dart';

class InputNameStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context);

    final String placeholder = viewModel.selectedPurpose == "브리더/업체"
        ? "업체명 또는 브리더명을 입력하세요"
        : "닉네임을 입력하세요";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 6,
              child: Row(
                children: [
                  Expanded(flex: 3, child: Container(color: AppColors.lightGreen)),
                  Expanded(flex: 1, child: Container(color: AppColors.darkGray)),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),

          // Title
          Text(
            placeholder,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 32),

          // Input Field
          OutlinedTextField(
            placeholder: placeholder,
            keyboardType: TextInputType.text,
            allowNumbers: false,
            maxLength: 20,
            textInputAction: TextInputAction.done,
            onChanged: (value) {
              if (viewModel.selectedPurpose == "브리더/업체") {
                viewModel.updateNickName(value);
              } else {
                viewModel.updatePersonalName(value);
              }
            },
          ),
          Spacer(),

          // Next Button
          BarButton(
            text: "다음",
            isEnabled: (viewModel.selectedPurpose == "브리더/업체"
                ? viewModel.NickName.isNotEmpty
                : viewModel.personalName.isNotEmpty),
            onPressed: () {
              if ((viewModel.selectedPurpose == "브리더/업체" &&
                  viewModel.NickName.isNotEmpty) ||
                  (viewModel.selectedPurpose == "개인사육자" &&
                      viewModel.personalName.isNotEmpty)) {
                viewModel.nextStep();
              }
            },
            enabledColor: AppColors.lightGreen,
            disabledColor: AppColors.darkGreen,
            enabledTextColor: AppColors.black,
            disabledTextColor: AppColors.black,
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
