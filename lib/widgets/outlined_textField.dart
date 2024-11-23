import 'package:flutter/material.dart';
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
  late TextEditingController _controller; // 텍스트 필드 컨트롤러

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    // 상태 변경 감지
    _controller.addListener(() {
      setState(() {}); // 텍스트 상태가 변경될 때 위젯 갱신
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
        hintText: _controller.text.isEmpty ? widget.placeholder : null, // 입력 전 플레이스홀더 표시
        hintStyle: TextStyle(color: AppColors.lightGray), // 플레이스홀더 스타일
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        counterText: "", // 최대 길이 표시 제거
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength > 0 ? widget.maxLength : null, // 0이면 길이 제한 없음
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
    );
  }
}
