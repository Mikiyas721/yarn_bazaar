import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShortMessageMixin {
  showErrorSnackBar(
    BuildContext context,
    String message, {
    String actionLabel = 'Ok',
    VoidCallback? onAction,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: onAction == null ? 4 : 10),
        content: Text(message),
        backgroundColor: Colors.red,
        action: onAction == null
            ? null
            : SnackBarAction(label: actionLabel, onPressed: onAction, textColor: Colors.white),
      ),
    );
  }

  showSuccessSnackBar(
    BuildContext context,
    String message, {
    String actionLabel = 'Ok',
    VoidCallback? onAction,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: onAction == null ? 4 : 10),
        content: Text(message),
        backgroundColor: Colors.green,
        action: onAction == null
            ? null
            : SnackBarAction(label: actionLabel, onPressed: onAction, textColor: Colors.white),
      ),
    );
  }

  toastSuccess(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  toastInformation(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.cyan,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  toastError(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<bool> showConfirmationDialog(BuildContext context,
      {String title = "Confirm", String content = "Are you sure you want to proceed?"}) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          );
        });
  }
}
