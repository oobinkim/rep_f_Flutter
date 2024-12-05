import 'package:cloud_firestore/cloud_firestore.dart';
import '../../viewmodels/profile_viewmodel.dart';

class ProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firestore에 프로필 데이터 저장 (users/{uid}/profiles/{profileDoc})
  Future<void> saveProfile(String uid, ProfileViewModel viewModel) async {
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
      };

      // Firestore 하위 컬렉션에 데이터 저장
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('profiles')
          .add(profileData);

      print("프로필 데이터가 성공적으로 저장되었습니다: $profileData");
    } catch (e) {
      throw Exception("프로필 저장 실패: $e");
    }
  }

  // Firestore에서 특정 사용자 하위의 프로필 데이터 조회
  Future<List<Map<String, dynamic>>> getProfiles(String uid) async {
    try {
      final querySnapshot = await _firestore
          .collection('users')
          .doc(uid)
          .collection('profiles')
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw Exception("프로필 조회 실패: $e");
    }
  }
}
