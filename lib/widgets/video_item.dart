import 'package:flutter/material.dart';
import 'package:see_really/models/videos_model.dart';

class VideoItem extends StatefulWidget {
  final VideosModel item;
  const VideoItem({required this.item, super.key});
  @override
  State<VideoItem> createState() => _VideoItem();
}

class _VideoItem extends State<VideoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7), topRight: Radius.circular(7)),
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: Image.network(
                "https://i.ytimg.com/vi/${widget.item.code}/maxresdefault.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                widget.item.title,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          )),
        ]));
  }
}
