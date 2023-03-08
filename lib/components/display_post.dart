import 'package:flutter/material.dart';

class DisplayPost extends StatelessWidget {
  final String title;
  final String description;
  const DisplayPost({
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
        color: Colors.grey,
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
                Icons.close,
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
