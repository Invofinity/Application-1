// import 'package:flutter/material.dart';

// class LoadingAnimation extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.black,
//       ),
//       home: AnimationShaderr(),
//     );
//   }
// }

// class AnimationShaderr extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<AnimationShaderr>
//     with SingleTickerProviderStateMixin {
//   AnimationController controllerOne;
//   Animation<Color> animationOne;
//   Animation<Color> animationTwo;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controllerOne = AnimationController(
//         duration: Duration(milliseconds: 2000), vsync: this);
//     animationOne = ColorTween(begin: Colors.grey[300], end: Colors.black)
//         .animate(controllerOne);
//     animationTwo = ColorTween(begin: Colors.black, end: Colors.grey)
//         .animate(controllerOne);
//     controllerOne.forward();
//     controllerOne.addListener(() {
//       if (controllerOne.status == AnimationStatus.completed) {
//         controllerOne.reverse();
//       } else if (controllerOne.status == AnimationStatus.dismissed) {
//         controllerOne.forward();
//       }
//       this.setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     controllerOne.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//           resizeToAvoidBottomPadding: false,
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ShaderMask(
//                     shaderCallback: (rect) {
//                       return LinearGradient(
//                               tileMode: TileMode.mirror,
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                               colors: [animationOne.value, animationTwo.value])
//                           .createShader(rect, textDirection: TextDirection.ltr);
//                     },
//                     child: SizedBox(
//                       height: MediaQuery.of(context).size.height - 50,
//                       child: ListView.builder(
//                           itemCount: 10,
//                           itemBuilder: (context, index) {
//                             return LoadingBlock();
//                           }),
//                     )),
//               ],
//             ),
//           )),
//     );
//   }
// }

// class LoadingBlock extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(),
//               child: ListView(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 8.0,
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 8.0,
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Container(
//                     width: 40.0,
//                     height: size.height * 0.40,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
