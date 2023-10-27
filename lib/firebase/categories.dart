import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:see_really/models/category_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
Future<List<CategoryModel>> getCategories() async {
  List<CategoryModel> categories = [];
  CollectionReference collectionReference = db.collection("categories");
  QuerySnapshot querySnapshot =
      await collectionReference.orderBy("title", descending: true).get();
  for (dynamic element in querySnapshot.docs) {
    CategoryModel category =
        CategoryModel.fromJson({...element.data(), "id": element.id});
    categories.add(category);
  }
  return categories;
}
