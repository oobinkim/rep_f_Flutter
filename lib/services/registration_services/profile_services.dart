import 'package:cloud_firestore/cloud_firestore.dart';
import '../../viewmodels/profile_viewmodel.dart';

class ProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firestore에 프로필 데이터 저장
  Future<void> saveProfile(ProfileViewModel viewModel) async {
    try {
      // Firestore에 저장할 데이터 구성
      final profileData = {
        "purpose": viewModel.selectedPurpose,
        "nickname": viewModel.NickName.isNotEmpty
            ? viewModel.NickName
            : viewModel.personalName,
        "businessNumber": viewModel.businessNumber.isNotEmpty
            ? viewModel.businessNumber
            : null,
        "mainSpecies": viewModel.selectedSpecies.isNotEmpty
            ? viewModel.selectedSpecies
            : null,
        "createdAt": FieldValue.serverTimestamp(),
      };

      // Firestore 컬렉션에 데이터 저장
      await _firestore.collection('profiles').add(profileData);

      print("프로필 데이터가 성공적으로 저장되었습니다: $profileData");
    } catch (e) {
      throw Exception("프로필 저장 실패: $e");
    }
  }

  // Firestore에서 프로필 데이터 조회
  Future<Map<String, dynamic>?> getProfile(String documentId) async {
    try {
      final doc = await _firestore.collection('profiles').doc(documentId).get();

      if (doc.exists) {
        return doc.data();
      }
      return null;
    } catch (e) {
      throw Exception("프로필 조회 실패: $e");
    }
  }
}
