class Ebook {
  final String uuid;
  final String title;
  final String description;
  final String thumbnail;
  final String ebookFile;

  Ebook({
    required this.uuid,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.ebookFile,
  });

  factory Ebook.fromJson(Map<String, dynamic> json) {
    return Ebook(
      uuid: json['uuid'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      ebookFile: json['ebook_file'],
    );
  }
}
