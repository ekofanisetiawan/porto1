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

  double posX = 0.0;
  double posY = 0.0;

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              width: boxSize,
              height: boxSize,
              color: Colors.amber,
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Text(
        'Taps: $numOfSingleTap - Double Taps: $numOfDoubleTap - Long Press: $numOfLongPress',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  void CenterPosition(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30;

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
