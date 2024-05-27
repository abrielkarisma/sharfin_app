class Insight {
  final String uuid;
  final String title;
  final String text;
  final List<String> img;
  final DateTime createdAt;
  final String uploadBy;

  const Insight(
      {required this.uuid,
      required this.title,
      required this.text,
      required this.img,
      required this.createdAt,
      required this.uploadBy});

  factory Insight.fromJson(Map<String, dynamic> json) => Insight(
        uuid: json['uuid'] as String,
        title: json['title'] as String,
        text: json['text'] as String,
        img: List<String>.from(json['img']),
        createdAt: DateTime.parse(json['created_at']),
        uploadBy: json['upload_by'] as String,
      );
}
