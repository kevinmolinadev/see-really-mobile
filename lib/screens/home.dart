import 'package:flutter/material.dart';
import 'package:see_really/firebase/categories.dart';
import 'package:see_really/models/category_model.dart';
import 'package:see_really/screens/add_video.dart';
import 'package:see_really/widgets/banner_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:see_really/widgets/category_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<CategoryModel> categories = [];
  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    categories = await getCategories();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                  items: categories
                      .map((e) => BannerItem(item: e, isCategory: false))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true, padEnds: false, viewportFraction: 1.0)),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) =>
                      CategoryItem(item: categories[index]))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddVideoForm())),
          child: const Icon(Icons.add),
        ));
  }
}
