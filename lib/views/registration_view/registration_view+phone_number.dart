import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/registration_viewmodel.dart';
import '../../widgets/bar_button.dart';
import '../../widgets/outlined_textField.dart';
import '../../share/app_color.dart';

class Step2PhoneNumber extends StatelessWidget {
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
            "휴대폰 번호를 입력해주세요",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          SizedBox(height: 24),
          OutlinedTextField(
            placeholder: "휴대폰 번호",
            allowNumbers: true,
            keyboardType: TextInputType.text,

            onChanged: (value) {
              viewModel.name = value;
              viewModel.notifyListeners();
            },
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCarrierOption(viewModel, "SKT"),
              _buildCarrierOption(viewModel, "KT"),
              _buildCarrierOption(viewModel, "LG U+"),
              _buildCarrierOption(viewModel, "알뜰폰"),
            ],
          ),
          Spacer(),
          BarButton(
            text: "다음",
            isEnabled: viewModel.phoneNumber.isNotEmpty && viewModel.carrier.isNotEmpty,
            onPressed: viewModel.phoneNumber.isNotEmpty && viewModel.carrier.isNotEmpty
                ? viewModel.nextStep
                : null,
            enabledColor: AppColors.lightGreen,
            disabledColor: AppColors.darkGreen,
            enabledTextColor: AppColors.black,
            disabledTextColor: AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildCarrierOption(RegistrationViewModel viewModel, String carrier) {
    final isSelected = viewModel.carrier == carrier;

    return GestureDetector(
      onTap: () {
        viewModel.carrier = carrier;
        viewModel.notifyListeners();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? AppColors.lightGreen : AppColors.lightGray),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppColors.lightGreen : AppColors.black,
        ),
        child: Text(
          carrier,
          style: TextStyle(color: isSelected ? AppColors.black : AppColors.white),
        ),
      ),
    );
  }
}
