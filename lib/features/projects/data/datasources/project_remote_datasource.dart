import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/features/projects/data/models/project_model.dart';

class ProjectRemoteDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProjectModel>> fetchProjects() async {
    try {
      final snapshot = await _firestore.collection('projects_categories').get();

      return snapshot.docs
          .map((doc) => ProjectModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch skills: $e");
    }
  }
}
