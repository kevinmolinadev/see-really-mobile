class VideosModel {
  String id;
  String code;
  String title;
  String description;
  VideosModel({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
  });

  factory VideosModel.fromJson(Map<String, dynamic> item) => VideosModel(
        id: item["id"],
        code: item["code"],
        title: item["title"],
        description: item["description"],
  );
}
