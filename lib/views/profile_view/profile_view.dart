import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/profile_viewmodel.dart';
import '../../share/app_color.dart';
import '../../widgets/bar_button.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.black,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                TextButton(
                  onPressed: () {
                    print("건너뛰기 눌림");
                  },
                  child: Text(
                    "건너뛰기",
                    style: TextStyle(color: AppColors.lightGray),
                  ),
                ),
              ],
            ),
            backgroundColor: AppColors.black,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressIndicator(),
                  SizedBox(height: 24),
                  Text(
                    "당신은 누구인가요?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    children: [
                      _buildOption(
                        icon: Icons.water_drop,
                        label: "브리더/업체",
                        isSelected: viewModel.selectedPurpose == "브리더/업체",
                        onTap: () => viewModel.selectPurpose("브리더/업체"),
                      ),
                      SizedBox(width: 16),
                      _buildOption(
                        icon: Icons.breakfast_dining,자
                        isSelected: viewModel.selectedPurpose == "일반사육자",
                        onTap: () => viewModel.selectPurpose("일반사육자"),
                      ),
                    ],
                  ),
                  Spacer(),
                  BarButton(
                    text: "다음",
                    isEnabled: viewModel.isPurposeSelected,
                    onPressed: viewModel.isPurposeSelected
                        ? () {
                      print("선택한 목적: ${viewModel.selectedPurpose}");
                    }
                        : null,
                    enabledColor: AppColors.lightGreen,
                    disabledColor: AppColors.darkGreen,
                    enabledTextColor: AppColors.black,
                    disabledTextColor: AppColors.black,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      height: 6,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(color: AppColors.lightGreen),
          ),
          Expanded(
            flex: 2,
            child: Container(color: AppColors.darkGray),
          ),
        ],
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.lightGreen : AppColors.darkGray,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: isSelected ? AppColors.black : AppColors.lightGray),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? AppColors.black : AppColors.lightGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
