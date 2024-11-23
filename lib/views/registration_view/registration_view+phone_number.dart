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
            keyboardType: TextInputType.number,
            maxLength: 11,
            onChanged: (value) {
              viewModel.phoneNumber = value;
              viewModel.notifyListeners();
            },
          ),
          SizedBox(height: 16),
          Row(
            children: [
              _buildCarrierOption(viewModel, "SKT", isFirst: true, isLast: false),
              _buildCarrierOption(viewModel, "KT", isFirst: false, isLast: false),
              _buildCarrierOption(viewModel, "LG U+", isFirst: false, isLast: false),
              _buildCarrierOption(viewModel, "알뜰폰", isFirst: false, isLast: true),
            ],
          ),
          Spacer(flex: 4),
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
          Spacer(flex: 1)
        ],
      ),
    );
  }

  Widget _buildCarrierOption(
      RegistrationViewModel viewModel,
      String carrier, {
        required bool isFirst,
        required bool isLast,
      }) {
    final isSelected = viewModel.carrier == carrier;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          viewModel.carrier = carrier;
          viewModel.notifyListeners();
        },
        child: Container(
          height: 48, // 버튼 높이
          decoration: BoxDecoration(
            color: isSelected ? AppColors.lightGray : AppColors.darkGray,
            border: Border.all(color: AppColors.lightGray),
            borderRadius: BorderRadius.horizontal(
              left: isFirst ? Radius.circular(8.0) : Radius.zero,
              right: isLast ? Radius.circular(8.0) : Radius.zero,
            ), // 왼쪽 끝, 오른쪽 끝만 둥글게 설정
          ),
          child: Center(
            child: Text(
              carrier,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.hintGray,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
