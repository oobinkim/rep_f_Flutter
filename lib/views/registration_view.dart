import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/registration_view_model.dart';

class RegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegistrationViewModel(),
      child: Consumer<RegistrationViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(title: Text("회원가입")),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "이메일"),
                    onChanged: (value) => viewModel.email = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "비밀번호"),
                    obscureText: true,
                    onChanged: (value) => viewModel.password = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "사용자 이름"),
                    onChanged: (value) => viewModel.userName = value,
                  ),
                  DropdownButton<String>(
                    value: viewModel.userType,
                    items: [
                      DropdownMenuItem(value: 'regular', child: Text("일반 사용자")),
                      DropdownMenuItem(value: 'breeder', child: Text("브리더")),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        viewModel.userType = value;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  if (viewModel.isLoading)
                    Center(child: CircularProgressIndicator())
                  else
                    ElevatedButton(
                      onPressed: () {
                        viewModel.register();
                      },
                      child: Text("회원가입"),
                    ),
                  if (viewModel.errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        viewModel.errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
