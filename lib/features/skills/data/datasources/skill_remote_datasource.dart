import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/skill_model.dart';

class SkillRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<SkillModel>> fetchSkills() async {
    try {
      final snapshot = await _firestore
          .collection('skill_categories')
          .orderBy('order', descending: false)
          .get();

      return snapshot.docs
          .map((doc) => SkillModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch skills: $e");
    }
  }
}
