import '../../domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({
    required super.title,
    required super.description,
    required super.technologies,
    required super.type,
    super.imageUrl,
    super.githubUrl,
    super.liveUrl,
    super.companyName,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      // Parsing the Array from Firestore safely
      technologies: List<String>.from(map['technologies'] ?? []),
      // Mapping the string from Firebase to your ProjectType Enum
      type: _parseProjectType(map['type'] as String?),
      imageUrl: map['image_url'] as String?,
      githubUrl: map['githubUrl'] as String?,
      liveUrl: map['live_url'] as String?,
      companyName: map['company_name'] as String?,
    );
  }

  // Helper method to convert String to Enum safely
  static ProjectType _parseProjectType(String? type) {
    switch (type?.toLowerCase()) {
      case 'public':
        return ProjectType.public;
      case 'private':
        return ProjectType.private;
      case 'work':
        return ProjectType.work;
      default:
        return ProjectType.public; // Default fallback
    }
  }
}
