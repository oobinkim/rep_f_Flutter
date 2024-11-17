import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String userName;
  final String userType;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.userName,
    required this.userType,
    required this.createdAt,
  });
  // Firestore 데이터에서 UserModel 객체로 변환
  factory UserModel.fromFirestore(Map<String, dynamic> data, String uid) {
    return UserModel(
      uid: uid,
      email: data['email'] ?? '',
      userName: data['userName'] ?? '',
      userType: data['userType'] ?? 'regular',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  // UserModel 객체를 Firestore에 저장 가능한 Map으로 변환
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'userName': userName,
      'userType': userType,
      'createdAt': createdAt,
    };
  }
}