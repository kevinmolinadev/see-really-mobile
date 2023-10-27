import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:see_really/models/videos_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
Future<List<VideosModel>> getVideosByCategory(String category) async {
  List<VideosModel> videos = [];
  CollectionReference collectionReference = db.collection("videos");
  QuerySnapshot querySnapshot = await collectionReference.where("category",isEqualTo: category).get();
  for (dynamic element in querySnapshot.docs) {
    VideosModel category =
        VideosModel.fromJson({...element.data(), "id": element.id});
    videos.add(category);
  }
  return videos;
}
