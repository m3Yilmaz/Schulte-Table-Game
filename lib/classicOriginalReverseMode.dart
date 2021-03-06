import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'resultPage.dart';

class ClassicOriginalReverseModePlayGround extends StatefulWidget {
  final ValueChanged<int> parentAction;
  const ClassicOriginalReverseModePlayGround({Key key, this.parentAction})
      : super(key: key);
  @override
  _ClassicOriginalReverseModePlayGroundState createState() =>
      _ClassicOriginalReverseModePlayGroundState();
}

class _ClassicOriginalReverseModePlayGroundState
    extends State<ClassicOriginalReverseModePlayGround> {
  _ClassicOriginalReverseModePlayGroundState() {
    var random = new Random();
    do {
      var checkIsValidInList = random.nextInt(MAX_ELEMENT_NUMBER) + 1;
      if (listUsedForRandomAssignment.contains(checkIsValidInList)) {
        this._number = checkIsValidInList;
        listUsedForRandomAssignment.remove(checkIsValidInList);
        break;
      }
    } while (true);
  }

  int _number;
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      child: FlatButton(
        splashColor: _hasBeenPressed ? Colors.transparent : Colors.white,
        child: Text(this._number.toString()),
        color: Colors.blueAccent,
        textColor: Colors.white,
        onPressed: () {
          if (sequenceControllerList.last == this._number) {
            var sumOfAllExistingElementsInList = 0;
            timePassedToFindNumbers.forEach((element) {
              sumOfAllExistingElementsInList += element;
            });
            timePassedToFindNumbers
                .add(globalTimer - sumOfAllExistingElementsInList);
            sequenceControllerList.removeLast();
            if (0 < this._number - 1) {
              widget.parentAction(this._number - 1);
            }

            setState(() {
              _hasBeenPressed = !_hasBeenPressed;
            });
            if (sequenceControllerList.isEmpty) {
              hasRoundFinished = true;
              timePassedToFindNumbers.removeAt(0);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          "bestTimeClassicOriginalReverse",
                          "Classic Original Reverse Mode",
                          timePassedToFindNumbers,
                          "/classicOriginalReverseMode",
                          true)));
            }
          }
        },
      ),
    );
  }
}
