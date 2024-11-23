import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user_models/user_models.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // user정보 ->  Firestore
  Future<UserModel?> registerUser({
    required String email,
    required String password,
    required String userName,
    required String userType,
  }) async {
    try {
      // Firebase Authentication으로 사용자 생성
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Firestore에 사용자 정보 저장
      final newUser = UserModel(
        uid: userCredential.user!.uid,
        userName: userName,
        userType: userType,
        createdAt: DateTime.now(),
      );

      await _firestore.collection('users').doc(newUser.uid).set(newUser.toFirestore());

      return newUser;
    } catch (e) {
      throw Exception("회원가입 실패: $e");
    }
  }

  // 사용자 정보 조회
  Future<UserModel?> getUser(String uid) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        return UserModel.fromFirestore(userDoc.data() as Map<String, dynamic>, uid);
      }
      return null;
    } catch (e) {
      throw Exception("사용자 정보 조회 실패: $e");
    }
  }
}
