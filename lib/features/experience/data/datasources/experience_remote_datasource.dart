import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/features/experience/data/models/experience_model.dart';

class ExperienceRemoteDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ExperienceModel>> fetchExperiences() async {
    try {
      final snapshot = await _firestore
          .collection('experiences')
          .orderBy('start_date', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => ExperienceModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch Experiences: $e");
    }
  }
}
