import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {


  @override
  void initState() {
    // TODO: implement initState
    getLocationPermission();
    super.initState();
  }

  void getLocationPermission()async{
    // Check if the app has permission to access the location.
    PermissionStatus status = await Permission.location.status;
    if (status.isRestricted) {
      // Request permission if it's undetermined.
      status = await Permission.location.request();
    }

    if (status.isDenied) {
      // Permission was denied. Handle this situation as needed.
      status = await Permission.location.request();
    } else if (status.isGranted) {
      // Permission was granted. You can now access the location.
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("sfg"),
        ],
      ),
    );
  }
}
