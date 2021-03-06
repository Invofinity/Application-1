import 'package:News_App/constants.dart';
import 'package:flutter/material.dart';

class ChallengesTile extends StatefulWidget {
  final String day;
  final String task;
  final int index;
  final int length;

  ChallengesTile({this.day, this.task, this.index, this.length});
  @override
  _ChallengesTileState createState() => _ChallengesTileState();
}

class _ChallengesTileState extends State<ChallengesTile> {
  //final bgColor = const Color(0xFFffffff);
  final cardColor = const Color(0xFFf8f8f8);
  //final txtColor = const Color(0xFF171717);
  final bgColor = Colors.black;
  final txtColor = Colors.white;
  final border = Colors.grey[300];
  final border1 = Colors.grey[400];
  @override
  Widget build(BuildContext context) {
    return widget.index == 0
        ? SingleChildScrollView(
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: down,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Text(
                              "Day " +
                                  widget
                                      .day /*!= null
                              ? widget.day.toString()
                              : ''*/
                              ,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ))),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 235,
                          child: Text(
                            widget
                                .task /*!= null
                              ? widget.day.toString()
                              : ''*/
                            ,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: txtColor,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          )
        : Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: Color(0xFFf6f6f6),
                color: Colors.grey[850]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Text(
                            "Day " +
                                widget
                                    .day /*!= null
                            ? widget.day.toString()
                            : ''*/
                            ,
                            style: TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: txtColor.withOpacity(0.4),
                            ),
                          ))),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 235,
                        child: Text(
                          widget
                              .task /*!= null
                            ? widget.day.toString()
                            : ''*/
                          ,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'PoppinsSemiBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: txtColor.withOpacity(0.4),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          );
  }
}
