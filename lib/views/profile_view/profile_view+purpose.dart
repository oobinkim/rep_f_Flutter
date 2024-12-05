import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../share/app_color.dart';
import '../../widgets/bar_button.dart';
import '../../widgets/grid_button.dart';
import '../../viewmodels/profile_viewmodel.dart';

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
            style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 24),

          // Options
          Row(
            children: [
              GridButton(
                label: "브리더/업체",
                icon: Icons.business,
                isSelected: viewModel.selectedPurpose == "브리더/업체",
                onTap: () => viewModel.selectPurpose("브리더/업체"),
              ),
              SizedBox(width: 16),
              GridButton(
                label: "개인사육자",
                icon: Icons.person,
                isSelected: viewModel.selectedPurpose == "개인사육자",
                onTap: () => viewModel.selectPurpose("개인사육자"),
              ),
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
}
