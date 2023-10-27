import 'package:flutter/material.dart';
import 'package:see_really/firebase/videos.dart';
import 'package:see_really/models/category_model.dart';
import 'package:see_really/models/videos_model.dart';
import 'package:see_really/screens/add_video.dart';
import 'package:see_really/widgets/banner_item.dart';
import 'package:see_really/widgets/video_item.dart';

class Category extends StatefulWidget {
  final CategoryModel category;
  const Category({required this.category, super.key});
  @override
  State<Category> createState() => _Category();
}

class _Category extends State<Category> {
  List<VideosModel> videos = [];
  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    videos = await getVideosByCategory(widget.category.title.toLowerCase());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 35,
                    height: 35,
                    child: Image.asset(
                      "lib/assets/logo.png",
                      fit: BoxFit.contain,
                    )),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "See Really",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ]),
          backgroundColor: Colors.black,
        ),
        body: Column(children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: BannerItem(
              item: widget.category,
              isCategory: true,
            ),
          ),
          Expanded(
              child: GridView.count(
                  padding: const EdgeInsets.all(5),
                  childAspectRatio: 16 / 12.5,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: videos
                      .map((e) => VideoItem(item: e, isCategory: true))
                      .toList()))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddVideoForm())),
          child: Icon(Icons.add),
        ));
  }
}
