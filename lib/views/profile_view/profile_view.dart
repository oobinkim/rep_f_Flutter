import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/profile_viewmodel.dart';
import 'profile_steps.dart';
import '../../share/app_color.dart';

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
              leading: viewModel.currentStep > 0
                  ? IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.white),
                onPressed: () {
                  viewModel.previousStep();
                },
              )
                  : null,
              actions: [
                if (viewModel.currentStep != 3) // 마지막 단계가 아닐 때
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
            body: PageView(
              controller: viewModel.pageController,
              physics: NeverScrollableScrollPhysics(), // 스와이프로 이동 금지
              children: [
                ProfilePurpose(),
                if (viewModel.selectedPurpose == "브리더/업체") BusinessNumberStep(),
                InputNameStep(),
                SpeciesSelectionStep(),
              ],
            ),
          );
        },
      ),
    );
  }
}
