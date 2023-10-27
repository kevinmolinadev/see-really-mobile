import 'package:flutter/material.dart';
import 'package:see_really/models/category_model.dart';
import 'package:see_really/screens/category.dart';

class BannerItem extends StatelessWidget {
  final CategoryModel item;
  final bool isCategory;
  const BannerItem({required this.item, required this.isCategory, super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.network(
            item.img,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.6],
          colors: [
            Colors.black87,
            Colors.transparent,
          ],
        ))),
        Container(
          color: Colors.black12,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  item.description,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  maxLines: isCategory ? null : 5,
                ),
              ),
              if (!isCategory)
                MaterialButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Category(category: item)),
                  ),
                  color: Colors.black,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "Ver categoria",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
