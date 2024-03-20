class Insight {
  final int id;
  final String title;
  final String description;
  final String image;
  final DateTime releaseDate;

  const Insight({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.releaseDate,
  });

  factory Insight.fromJson(Map<String, dynamic> json) {
    return Insight(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      releaseDate: DateTime.parse(json['releaseDate'] as String),
    );
  }
}
