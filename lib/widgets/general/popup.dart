import 'package:flutter/material.dart';

import '../../colors.dart';

enum PopupControlType { ok, confirm, confirmCancel, neverAgain, home }
enum PopupControlIcon { warning, success, question, info, none, rewards }

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black87,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.all(0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);

Future<dynamic> popup({
  required BuildContext context,
  required List<String?> messages,
  required PopupControlType type,
  required PopupControlIcon icon,
  Widget? iconAlt,
  String? title,
  Function? onConfirm,
  Function? onCancel,
  Function? onNeverAgain,
}) async {
  //bool isBusy = false;

  return await showDialog<void>(
    context: context,
    barrierDismissible: type == PopupControlType.neverAgain ? true : false, // user must tap button!
    builder: (BuildContext context) {
      // switch (type) {
      //   case PopupControlType.dashed:
      //     isDashed = true;
      //     break;
      //   default:
      //     break;
      // }

      return AlertDialog(
        title: Column(
          children: <Widget>[
            icon == PopupControlIcon.warning
                ? Container(
                    height: 30,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Icon(
                      Icons.warning,
                      color: colorOrange,
                      size: 30,
                    ),
                  )
                : Container(),
            icon == PopupControlIcon.success
                ? Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Icon(
                      Icons.check_circle,
                      color: colorPrimary,
                      size: 30,
                    ),
                  )
                : Container(),
            icon == PopupControlIcon.question
                ? Container(
                    margin:const EdgeInsets.only(bottom: 10),
                    child: const Icon(
                      Icons.help_outline,
                      color: colorGreen,
                      size: 30,
                    ),
                  )
                : Container(),
            icon == PopupControlIcon.info
                ? Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Icon(
                      Icons.info_outline,
                      color: colorGreen,
                      size: 30,
                    ),
                  )
                : Container(),
            icon == PopupControlIcon.rewards
                ? Container(
                    height: 30,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Icon(
                      Icons.emoji_events,
                      color: colorBlack,
                      size: 30,
                    ),
                  )
                : Container(),
            iconAlt != null && icon == PopupControlIcon.none
                ? Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: iconAlt,
                  )
                : Container(),
            title != null && title != ""
                ? Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(title),
                  )
                : Container()
          ],
        ),
        backgroundColor: colorBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.all(20),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  // crossAxisAlignment: isDashed
                  //     ? CrossAxisAlignment.start
                  //     : CrossAxisAlignment.center,
                  children: messages.map((message) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        messages.length > 1
                            ? Container(
                                padding: const EdgeInsets.only(right: 5),
                                child: const Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(130, 130, 130, 1),
                                  ),
                                ))
                            : Container(),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              message!,
                              textAlign: messages.length > 1 ? TextAlign.left : TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(130, 130, 130, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              type == PopupControlType.ok
                  ? Container(
                      padding: const EdgeInsets.all(0),
                      margin: const EdgeInsets.only(top: 20),
                      height: 45,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                        ),
                      ),
                      child: TextButton(
                        style: flatButtonStyle,   
                        child: const Text("Ok"),       
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          if (onConfirm != null) {
                            onConfirm();
                          }
                        },
                      ),
                    )
                  : Container(),
              type == PopupControlType.confirm
                  ? Container(
                      padding: const EdgeInsets.all(0),
                      margin: const EdgeInsets.only(top: 20),
                      height: 45,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                        ),
                      ),
                      child: TextButton(
                        style: flatButtonStyle,
                        child: const Text("Confirm"),              
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          if (onConfirm != null) {
                            onConfirm();
                          }
                        },
                      ),
                    )
                  : Container(),
              type == PopupControlType.home
                  ? Container(
                      padding: const EdgeInsets.all(0),
                      margin: const EdgeInsets.only(top: 20),
                      height: 45,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                        ),
                      ),
                      child: TextButton(
                        style: flatButtonStyle,
                        child: const Text("Home"),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          if (onConfirm != null) {
                            onConfirm();
                          }
                        },
                      ),
                    )
                  : Container(),
              type == PopupControlType.confirmCancel
                  ? Container(
                      //padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 20),
                      height: 45,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: TextButton(
                              style: flatButtonStyle,
                              child: const Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                                if (onCancel != null) {
                                  onCancel();
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              style: flatButtonStyle,
                              child: const Text("Confirm"),
                              onPressed: () async {
                                // Navigator.pop(context, true);
                                if (onConfirm != null) {
                                  Navigator.of(context).pop(true);
                                  await onConfirm();
                                } else {
                                  Navigator.of(context).pop(true);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              type == PopupControlType.neverAgain
                  ? Container(
                      //padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 20),
                      height: 45,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // Expanded(
                          //   child: FlatButton(
                          //     materialTapTargetSize:
                          //         MaterialTapTargetSize.shrinkWrap,
                          //     padding: EdgeInsets.all(0),
                          //     child: Text("Cancel"),
                          //     splashColor: colors_splash,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.only(
                          //         bottomLeft: Radius.circular(20),
                          //       ),
                          //     ),
                          //     onPressed: () {
                          //       Navigator.of(context).pop(false);
                          //       if (onCancel != null) {
                          //         onCancel();
                          //       }
                          //     },
                          //   ),
                          // ),
                          Expanded(
                            child: TextButton(
                              style: flatButtonStyle,
                              child: const Text("Take me there"),
                              onPressed: () async {
                                // Navigator.pop(context, true);
                                if (onConfirm != null) {
                                  Navigator.of(context).pop(true);
                                  await onConfirm();
                                } else {
                                  Navigator.of(context).pop(true);
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              style: flatButtonStyle,
                              child: const Text("Never ask again"),
                              
                              onPressed: () async {
                                // Navigator.pop(context, true);
                                if (onNeverAgain != null) {
                                  await onNeverAgain();
                                  Navigator.of(context).pop(true);
                                } else {
                                  Navigator.of(context).pop(true);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    },
  );
}

//// Sample usage:
// alert(context: context,
//   title: "Hello",
//   messages: [
//     Text("One"),
//     Text("Two")
//   ], buttons: [
//     ButtonControl(title: "Yes", type: ButtonControlType.primary, onPress: () {},),
//     ButtonControl(title: "No", type: ButtonControlType.primary, onPress: () { Navigator.of(context).pop(); },)
//   ]
// );
