import 'package:flutter/material.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(tag: 'image_animation', child: Image.asset('rendang3.png')),

      //     // body: Column(
      //     //   children: [
      //     //     Center(
      //     //       child: IconButton(
      //     //         onPressed: () {},
      //     //         icon: Icon(Icons.play_arrow),
      //     //         iconSize: 50,
      //     //         color: Color(0xFF014D4E),
      //     //       ),
      //     //     ),
      //     //   ],
      //     // ),
      //     body: LayoutBuilder(builder: (BuildContext context, constraints) {
      //   if (constraints.maxWidth < 600) {
      //     return ListView(
      //       children: _generateConstraints(),
      //     );
      //   } else if (constraints.maxWidth < 900) {
      //     return GridView.count(
      //       crossAxisCount: 2,
      //       children: _generateConstraints(),
      //     );
      //   } else {
      //     return GridView.count(
      //       crossAxisCount: 6,
      //       children: _generateConstraints(),
      //     );
      //   }
      // }));
    );
  }

  List<Widget> _generateConstraints() {
    return List<Widget>.generate(10, (index) {
      return Container(
        margin: EdgeInsets.all(8),
        color: Colors.blueGrey,
        height: 200,
      );
    });
  }
}
