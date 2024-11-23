import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../share/app_color.dart';

class OutlinedTextField extends StatefulWidget {
  final String placeholder; // 플레이스홀더 텍스트
  final TextInputType keyboardType; // 키보드 유형
  final int maxLength; // 최대 입력 길이
  final ValueChanged<String>? onChanged; // 값 변경 콜백
  final bool obscureText; // 텍스트 가림 여부

  const OutlinedTextField({
    Key? key,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
    this.maxLength = 0,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _OutlinedTextFieldState createState() => _OutlinedTextFieldState();
}

class _OutlinedTextFieldState extends State<OutlinedTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: _controller.text.isEmpty ? widget.placeholder : null,
        hintStyle: TextStyle(color: AppColors.lightGray),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        counterText: "",
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength > 0 ? widget.maxLength : null,
      obscureText: widget.obscureText,
      inputFormatters: [
        KoreanEnglishTextInputFormatter(), // 사용자 정의 필터링 추가
      ],
      onChanged: widget.onChanged,
    );
  }
}

class KoreanEnglishTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // 한글 및 영어만 허용하는 정규식
    final regex = RegExp(r'^[a-zA-Zㄱ-ㅎ가-힣]*$');

    // 새 텍스트가 정규식에 맞으면 그대로 반환
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }

    // 정규식에 맞지 않으면 이전 텍스트를 유지
    return oldValue;
  }
}
