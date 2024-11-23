import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/registration_viewmodel.dart';
import '../../share/app_color.dart';
import 'registration_steps.dart';

class RegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegistrationViewModel(),
      child: Consumer<RegistrationViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.black,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.white),
                onPressed: () {
                  if (viewModel.currentStep == 0) {
                    // 첫 화면에서는 Agreement로 이동
                    viewModel.navigateToAgreement(context);
                  } else {
                    // 다른 화면에서는 이전 단계로 이동
                    viewModel.previousStep();
                  }
                },
              ),
            ),
            backgroundColor: AppColors.black,
            body: PageView(
              controller: viewModel.pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Step1PersonalInfo(),
                Step2PhoneNumber(),
                Step3AuthCode(),
                Step4Completion(),
              ],
            ),
          );
        },
      ),
    );
  }
}
