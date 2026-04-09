import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/profile_model.dart';

class ProfileRemoteDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProfileModel> fetchProfile() async {
    try {
      final doc = await _firestore
          .collection('profile_categories')
          .doc("w0W6916aHHIpvgo0TxG2")
          .get();

      if (doc.exists && doc.data() != null) {
        final profile = ProfileModel.fromMap(doc.data()!);

        // Sort Certifications: Newest Year first
        profile.certifications.sort((a, b) => b.year.compareTo(a.year));

        // Optional: Sort Educations: Newest Start Date first
        profile.educations.sort((a, b) => b.startDate.compareTo(a.startDate));

        return profile;
      } else {
        throw Exception("Profile not found");
      }
    } catch (e) {
      throw Exception("Failed to fetch Profiles: $e");
    }
  }
}
