import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotnote/screens/login_screen.dart';
import 'package:spotnote/screens/notes_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key, required this.securityStatus});
  bool securityStatus;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 75, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Spot",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "N",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                        Text(
                          "ote",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 35),
                      child: const Text(
                        "create and access your notes easily 🗒️",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/images/splash_screen_image.png',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              SizedBox(
                width: 180.0,
                height: 50.0,
                child: ElevatedButton(
                    onPressed: () async {
                      if (widget.securityStatus == true) {
                        Get.to(() => const LoginScreen());
                      }
                      if (widget.securityStatus == false) {
                        setState(() {
                          widget.securityStatus = false;
                        });

                        await Get.to(() => const NotesScreen());
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber.shade400),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Let's Go",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ],
                    )),
              ),
              const SizedBox(width: 50),
            ],
          ),
        ));
  }
}
