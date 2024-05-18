import 'dart:math';

import 'package:flutter/material.dart';

double randomBorderRadius() {
  return Random().nextDouble() * 20;
}

double randomMargin() {
  return Random().nextDouble() * 20;
}

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  late double borderRadius;
  late double margin;

  void initState() {
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  void changeState() {
    setState(() {
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.ease,
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(borderRadius)),
              ),
            ),
            ElevatedButton(onPressed: () => changeState(), child: Text('Ubah'))
          ],
        ),
      ),
    ));
  }
}



// class AddStoryScreen extends StatelessWidget {
//   const AddStoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Hero(tag: 'image_animation', child: Image.asset('rendang3.png')),

//       //     // body: Column(
//       //     //   children: [
//       //     //     Center(
//       //     //       child: IconButton(
//       //     //         onPressed: () {},
//       //     //         icon: Icon(Icons.play_arrow),
//       //     //         iconSize: 50,
//       //     //         color: Color(0xFF014D4E),
//       //     //       ),
//       //     //     ),
//       //     //   ],
//       //     // ),
//       //     body: LayoutBuilder(builder: (BuildContext context, constraints) {
//       //   if (constraints.maxWidth < 600) {
//       //     return ListView(
//       //       children: _generateConstraints(),
//       //     );
//       //   } else if (constraints.maxWidth < 900) {
//       //     return GridView.count(
//       //       crossAxisCount: 2,
//       //       children: _generateConstraints(),
//       //     );
//       //   } else {
//       //     return GridView.count(
//       //       crossAxisCount: 6,
//       //       children: _generateConstraints(),
//       //     );
//       //   }
//       // }));
//     );
//   }

//   List<Widget> _generateConstraints() {
//     return List<Widget>.generate(10, (index) {
//       return Container(
//         margin: EdgeInsets.all(8),
//         color: Colors.blueGrey,
//         height: 200,
//       );
//     });
//   }
// }
