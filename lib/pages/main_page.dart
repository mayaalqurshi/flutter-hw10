import 'package:flutter/material.dart';
import 'package:flutter_homework_9/components/dart.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF282a32),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((context) {
                            return Container(
                              height: 600.0,
                              color: const Color(0xFF282a32),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20.0),
                                  const Text(
                                    "Add Your Post GEEK",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 25.0,
                                    ),
                                    child: TextField(
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                      ),
                                      controller: titleController,
                                      decoration: InputDecoration(
                                        hintText: 'title',
                                        hintStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 3,
                                            color: Colors.amber,
                                          ),
                                          borderRadius: BorderRadius.circular(50.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                            width: 3,
                                            color: Color(0xff8b368c),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  /// some fixing here ..........
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 25.0,
                                    ),
                                    child: TextField(
                                      controller: descriptionController,
                                      decoration: InputDecoration(
                                        hintText: 'Description',
                                        hintStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 3,
                                            color: Colors.amber,
                                          ),
                                          borderRadius: BorderRadius.circular(50.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                            width: 3,
                                            color: Color(0xff8b368c),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 40.0),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        Data.posts.add(
                                            Post(title: titleController.text, description: descriptionController.text));
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add_circle_outline_outlined,
                                      size: 50.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        );
                      },
                      child: const Icon(
                        Icons.add_circle_outline_rounded,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello Mustafa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'In spotlights',
                        style: TextStyle(
                          color: Color(0xFFbfbec3),
                          fontSize: 20.0,
                        ),
                      ),
                      for (var post in Data.posts)
                        MnWidget(
                          title: post.title,
                          description: post.description,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MnWidget extends StatelessWidget {
  final String title;
  final String description;
  const MnWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.save_alt_outlined,
                size: 30.0,
                color: Colors.white,
              ),
              const SizedBox(width: 8.0),
              const Icon(
                Icons.menu,
                size: 30.0,
                color: Colors.white,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0, top: 15.0),
            child: Text(
              description,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}
