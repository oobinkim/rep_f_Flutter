import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/profile_viewmodel.dart';
import '../../share/app_color.dart';
import '../../widgets/bar_button.dart';
import '../../widgets/outlined_textField.dart';

class BusinessNumberStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context);

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
                  Expanded(flex: 2, child: Container(color: AppColors.lightGreen)),
                  Expanded(flex: 2, child: Container(color: AppColors.darkGray)),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),

          // Title
          Text(
            "사업자 등록 번호를 알려주세요!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 32),

          // Outlined Text Fields
          Row(
            children: [
              Expanded(
                flex: 2,
                child: OutlinedTextField(
                  placeholder: "",
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maxLength: 3,
                  allowNumbers: true,
                  onChanged: (value) {
                    viewModel.updateBusinessNumberParts("first", value);
                  },
                ),
              ),
              SizedBox(width: 8),
              Text(
                "-",
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: OutlinedTextField(
                  placeholder: "",
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maxLength: 2,
                  allowNumbers: true,
                  onChanged: (value) {
                    viewModel.updateBusinessNumberParts("middle", value);
                  },
                ),
              ),
              SizedBox(width: 8),
              Text(
                "-",
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: OutlinedTextField(
                  placeholder: "",
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  maxLength: 5,
                  allowNumbers: true,
                  onChanged: (value) {
                    viewModel.updateBusinessNumberParts("last", value);
                  },
                ),
              ),
            ],
          ),
          Spacer(),

          // Next Button
          BarButton(
            text: "다음",
            isEnabled: viewModel.businessNumber.isNotEmpty, // 버튼 활성화 조건
            onPressed: viewModel.businessNumber.isNotEmpty
                ? viewModel.nextStep
                : null,
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
