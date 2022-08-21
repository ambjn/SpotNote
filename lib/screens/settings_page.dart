import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:spotnote/screens/splash_screen.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key, required this.isToggled});
  bool isToggled;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "Spot",
                style: TextStyle(fontSize: 45, color: Colors.grey),
              ),
              Text(
                "N",
                style: TextStyle(fontSize: 45, color: Colors.amber),
              ),
              Text(
                "ote",
                style: TextStyle(fontSize: 45, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text(
              "Settings",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            )
          ]),
          const SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enable Security: ",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(width: 20),
              FlutterSwitch(
                height: 20.0,
                width: 40.0,
                padding: 4.0,
                toggleSize: 15.0,
                borderRadius: 10.0,
                activeColor: Colors.redAccent,
                value: widget.isToggled,
                onToggle: (value) async {
                  setState(() {
                    widget.isToggled = value;
                  });
                  await Get.to(
                      () => SplashScreen(securityStatus: widget.isToggled));
                },
              ),
            ],
          ),
        ],
      )),
    );
  }
}
