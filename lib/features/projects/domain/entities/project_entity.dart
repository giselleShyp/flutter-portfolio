enum ProjectType { public, private, work }

class ProjectEntity {
  final String title;
  final String description;
  final String? imageUrl;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final String? companyName;
  final ProjectType type;

  ProjectEntity({
    required this.title,
    required this.description,
    required this.technologies,
    required this.type,
    this.imageUrl,
    this.githubUrl,
    this.liveUrl,
    this.companyName,
  });
}
