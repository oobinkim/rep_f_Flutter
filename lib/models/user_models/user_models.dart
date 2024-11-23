import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid; // 사용자 고유 ID
  final String userName; // 사용자 이름
  final String userType; // 사용자 유형 (regular, breeder 등)
  final String birthDate; // 생년월일 앞 6자리
  final String gender; // 성별
  final String phoneNumber; // 전화번호
  final String carrier; // 통신사
  final DateTime createdAt; // 생성 날짜

  UserModel({
    required this.uid,
    required this.userName,
    required this.userType,
    required this.birthDate,
    required this.gender,
    required this.phoneNumber,
    required this.carrier,
    required this.createdAt,
  });

  // Firestore 데이터에서 UserModel 객체로 변환
  factory UserModel.fromFirestore(Map<String, dynamic> data, String uid) {
    return UserModel(
      uid: uid,
      userName: data['userName'] ?? '',
      userType: data['userType'] ?? 'regular',
      birthDate: data['birthDate'] ?? '',
      gender: data['gender'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      carrier: data['carrier'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  // UserModel 객체를 Firestore에 저장 가능한 Map으로 변환
  Map<String, dynamic> toFirestore() {
    return {
      'userName': userName,
      'userType': userType,
      'birthDate': birthDate,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'carrier': carrier,
      'createdAt': createdAt,
    };
  }
}
