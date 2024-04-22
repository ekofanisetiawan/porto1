import 'package:flutter/material.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_arrow),
              iconSize: 50,
              color: Color(0xFF014D4E),
            ),
          ),
        ],
      ),
    );
  }
}
