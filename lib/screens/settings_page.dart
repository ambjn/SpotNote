import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isToggled = true;
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
                value: isToggled,
                onToggle: (value) {
                  setState(() {
                    isToggled = value;
                  });
                },
              ),
            ],
          ),
        ],
      )),
    );
  }
}