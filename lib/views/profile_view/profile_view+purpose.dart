import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/profile_viewmodel.dart';
import '../../share/app_color.dart';
import '../../widgets/bar_button.dart';

class ProfilePurpose extends StatelessWidget {
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
                  Expanded(flex: 1, child: Container(color: AppColors.lightGreen)),
                  Expanded(flex: 3, child: Container(color: AppColors.darkGray)),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),

          // Title
          Text(
            "당신은 누구신가요?",
            style: TextStyle(color: AppColors.white, fontSize: 24),
          ),
          SizedBox(height: 24),

          // Options
          Row(
            children: [
              _buildOption(context, "브리더/업체", Icons.business),
              SizedBox(width: 16),
              _buildOption(context, "개인사육자", Icons.person),
            ],
          ),
          Spacer(),

          // Next Button
          BarButton(
            text: "다음",
            isEnabled: viewModel.isPurposeSelected,
            onPressed: viewModel.isPurposeSelected ? viewModel.nextStep : null,
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

  Widget _buildOption(BuildContext context, String label, IconData icon) {
    final viewModel = Provider.of<ProfileViewModel>(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          viewModel.selectPurpose(label);
        },
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            color: AppColors.darkGray,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: viewModel.selectedPurpose == label
                  ? AppColors.lightGreen // 선택된 경우 라이트그린 테두리
                  : Colors.transparent, // 선택되지 않은 경우 투명 테두리
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 36,
                color: AppColors.lightGray,
              ),
              SizedBox(height: 16),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
