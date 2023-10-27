class CategoryModel {
  String id;
  String title;
  String description;
  String img;
  CategoryModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.img});
  factory CategoryModel.fromJson(Map<String, dynamic> item) => CategoryModel(
      id: item["id"],
      title: item["title"].substring(0, 1).toUpperCase() +
          item["title"].substring(1),
      description: item["description"],
      img: item["img"]);

  String firstLetterToUpperCase(String text) {
    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }
}
