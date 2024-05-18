import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// class InfoDetailScreen extends StatelessWidget {
//   const InfoDetailScreen({super.key});

//   @override
//   State<InfoDetailScreen> createState() => InfoDetailScreen();
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     Orientation screenOrientation = MediaQuery.of(context).orientation;

class InfoDetailScreen extends StatefulWidget {
  const InfoDetailScreen({super.key});

  @override
  State<InfoDetailScreen> createState() => _InfoDetailScreenState();
}

class _InfoDetailScreenState extends State<InfoDetailScreen> {
  final double boxSize = 150.0;
  int numOfSingleTap = 0;
  int numOfDoubleTap = 0;
  int numOfLongPress = 0;

  late double borderRadius;
  late double margin;
  late Color warna;

  double posX = 0.0;
  double posY = 0.0;

  @override
  void initState() {
// penggunaan initState
    super.initState();
    margin = randomMargin();
    borderRadius = randomBorderRadius();
    warna = randomCalor();
  }

  double randomBorderRadius() {
    return Random().nextDouble() * 20;
  }

  double randomMargin() {
    return Random().nextDouble() * 20;
  }

  Color randomCalor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  void changeState() {
    setState(() {
      borderRadius = randomBorderRadius();
      margin = randomMargin();
      warna = randomCalor();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(borderRadius);
    if (posX == 0) {
      CenterPosition(context);
    }

    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: posX,
          top: posY,
          child: GestureDetector(
            // onVerticalDragUpdate: (DragUpdateDetails details) {
            //   setState(() {
            //     // double verticalPosition = details.verticalPosition.dy;
            //     // double delta = details.delta.dx;
            //     double verticalPosition = details.delta.dy;
            //     posY += verticalPosition;
            //   });
            // },
            // onHorizontalDragUpdate: (DragUpdateDetails details) {
            //   setState(() {
            //     double horizontalPosition = details.delta.dx;
            //     posX += horizontalPosition;
            //   });
            // },
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                double verticalPosition = details.delta.dy;
                double horizontalPosition = details.delta.dx;
                posX += horizontalPosition;
                posY += verticalPosition;
              });
            },
            onTap: () {
              setState(() {
                numOfSingleTap++;
                changeState();
              });
            },

            onDoubleTap: () {
              setState(() {
                numOfDoubleTap++;
              });
            },
            onLongPress: () {
              setState(() {
                numOfLongPress++;
              });
            },

            child: SizedBox(
              width: 200,
              height: 200,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: warna,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        height: 60,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text("Taps : $numOfSingleTap"),
          Text("Double Taps : $numOfDoubleTap"),
          Text("Long Press : $numOfLongPress")
        ]),
      ),
    );
  }

  void CenterPosition(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2;

    setState(() {
      this.posX = posX;
      this.posY = posY;
    });
  }
}

      // backgroundColor: Colors.white,
      // body: SafeArea(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Text(
      //         'Screen Size: ${screenSize.width.toStringAsFixed(2)}',
      //         style: TextStyle(color: Color(0xFF014D4E), fontSize: 18),
      //         textAlign: TextAlign.center,
      //       ),
      //       Text(
      //         'Screen Orientation: $screenOrientation',
      //         style: TextStyle(color: Color(0xFF014D4E), fontSize: 18),
      //         textAlign: TextAlign.center,
      //       ),
      //     ],
      //   ),
      // ),
  //   );
  // }
// }
