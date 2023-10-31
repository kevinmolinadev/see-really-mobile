import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddVideoForm extends StatefulWidget {
  const AddVideoForm({super.key});
  @override
  State<AddVideoForm> createState() => _AddVideoFormState();
}

class _AddVideoFormState extends State<AddVideoForm> {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  Future<void> _addVideo() async {
    String url = _urlController.text;
    String description = _descriptionController.text;
    String category = _categoryController.text;
    String title = _titleController.text;
    if (url.isNotEmpty && description.isNotEmpty) {
      CollectionReference videos =
          FirebaseFirestore.instance.collection('videos');
      try {
        await videos.add({
          'description': description,
          'category': category,
          'title': title,
          'code': url.split("v=")[1],
        });
        print("Se agrego un nuevo video");
      } catch (e) {
        print(e);
      }
    }
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
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          child: Card(
              child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Agregar Video",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _urlController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Url"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Descripción"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Categoria"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Titulo"),
                  ),
                ),
                MaterialButton(
                  onPressed: _addVideo,
                  child: const Text("Agregar"),
                  color: Colors.black,
                  textColor: Colors.white,
                )
              ],
            ),
          )),
        ));
  }
}
