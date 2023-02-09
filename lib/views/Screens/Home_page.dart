import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PermissionStatus? location;
  PermissionStatus? calender;
  PermissionStatus? audio;
  PermissionStatus? storage;
  PermissionStatus? sms;
  PermissionStatus? camera;
  PermissionStatus? phone;

  // Future<void> requestPermission() async {
  //   Map<Permission, PermissionStatus> res = await [
  //     Permission.location,
  //     Permission.camera,
  //     Permission.contacts,
  //     Permission.storage,
  //   ].request();
  //   print(res);
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   requestPermission();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await openAppSettings();
            },
            icon: Icon(Icons.settings),
          ),
        ],
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  PermissionStatus status = await Permission.location.request();
                  setState(() {
                    location = status;
                  });
                },
                child: Text("Location")),
            Text("${location}"),
            ElevatedButton(
                onPressed: () async {
                  PermissionStatus status = await Permission.calendar.request();
                  setState(() {
                    calender = status;
                  });
                },
                child: Text("Calender")),
            Text("${calender}"),
            ElevatedButton(
                onPressed: () async {
                  PermissionStatus status =
                      await Permission.microphone.request();
                  setState(() {
                    audio = status;
                  });
                },
                child: Text("Audio")),
            Text("${audio}"),
            ElevatedButton(
                onPressed: () async {
                  PermissionStatus status = await Permission.storage.request();
                  setState(() {
                    audio = status;
                  });
                },
                child: Text("Storage")),
            Text("${storage}"),
            ElevatedButton(
                onPressed: () async {
                  PermissionStatus status = await Permission.sms.request();
                  setState(() {
                    sms = status;
                  });
                },
                child: Text("SMS")),
            Text("${sms}"),
            ElevatedButton(
                onPressed: () async {
                  PermissionStatus status = await Permission.camera.request();
                  setState(() {
                    camera = status;
                  });
                },
                child: Text("Camera")),
            Text("${camera}"),
            ElevatedButton(
                onPressed: () async {
                  PermissionStatus status = await Permission.phone.request();
                  setState(() {
                    phone = status;
                  });
                },
                child: Text("Phone")),
            Text("${phone}"),
          ],
        ),
      ),
    );
  }
}
