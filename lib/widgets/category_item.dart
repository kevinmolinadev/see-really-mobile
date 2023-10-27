import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:see_really/firebase/videos.dart';
import 'package:see_really/models/category_model.dart';
import 'package:see_really/models/videos_model.dart';
import 'package:see_really/screens/category.dart';
import 'package:see_really/widgets/video_item.dart';

class CategoryItem extends StatefulWidget {
  final CategoryModel item;
  const CategoryItem({required this.item, super.key});
  @override
  State<CategoryItem> createState() => _CategoryItem();
}

class _CategoryItem extends State<CategoryItem> {
  List<VideosModel> videos = [];
  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    videos = await getVideosByCategory(widget.item.title.toLowerCase());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return videos.isNotEmpty
        ? Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.item.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Category(category: widget.item))),
                        icon: const Icon(Icons.arrow_forward_sharp)),
                  ],
                ),
                CarouselSlider(
                    items: videos.map((e) => VideoItem(item: e)).toList(),
                    options: CarouselOptions(
                        viewportFraction: 0.75,
                        height: 200,
                        enlargeCenterPage: true)),
              ],
            ),
          )
        : const SizedBox();
  }
}
