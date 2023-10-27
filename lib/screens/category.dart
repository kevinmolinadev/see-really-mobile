import 'package:flutter/material.dart';
import 'package:see_really/models/category_model.dart';
import 'package:see_really/widgets/banner_item.dart';

class Category extends StatefulWidget {
  final CategoryModel category;
  const Category({required this.category, super.key});
  @override
  State<Category> createState() => _Category();
}

class _Category extends State<Category> {
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
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: BannerItem(
                item: widget.category,
                isCategory: true,
              ),
            )
          ],
        ));
  }
}
