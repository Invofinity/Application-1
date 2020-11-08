// import 'package:flutter/material.dart';

// class RoundedButton extends StatelessWidget {
//   final String text;
//   final Function press;
//   final double verticalPadding;
//   final double fontSize;
//   const RoundedButton({
//     Key key,
//     this.text,
//     this.press,
//     this.verticalPadding = 16,
//     this.fontSize = 16,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.symmetric(vertical: 16),
//         padding:
//             EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 30),
//         decoration: BoxDecoration(
//           color: Colors.orange[700],
//           borderRadius: BorderRadius.circular(30),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0, 15),
//               blurRadius: 30,
//               color: Color(0xFFFFB74D).withOpacity(0.55),
//             ),
//           ],
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: fontSize,
//             fontFamily: 'PoppinsSemiBold',
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
