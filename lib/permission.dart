import 'package:News_App/screens/Welcome/welcome_screen.dart';
import 'package:News_App/views/home.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AskPermissions extends StatefulWidget {
  @override
  _AskPermissions createState() => new _AskPermissions();
}

class _AskPermissions extends State<AskPermissions> {
  @override
  PermissionStatus _permissionStatus;

  void _askPermission() {
    PermissionHandler().requestPermissions(
        [PermissionGroup.locationWhenInUse]).then(_onStatusRequested);
  }

  void _onStatusRequested(
      Map<PermissionGroup, PermissionStatus> statuses) async {
    final status = await statuses[PermissionGroup.locationWhenInUse];
    if (status != PermissionStatus.granted) {
      PermissionHandler().openAppSettings();
    } else {
      _updateStatus(status);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home()));
    }
  }

  void _updateStatus(PermissionStatus status) {
    if (status != _permissionStatus) {
      setState(() {
        _permissionStatus = status;
      });
    }
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {}
}
