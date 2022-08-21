import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {});
      authenticated = await auth.authenticate(
        localizedReason: 'Kindly authenticate to access SpotNote',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {});
    } on PlatformException catch (e) {
      print(e);
      setState(() {});
      return;
    }
    if (!mounted) {
      return;
    }
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {});
      authenticated = await auth.authenticate(
        localizedReason: 'Kindly authenticate to access SpotNote',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {});
    } on PlatformException catch (e) {
      print(e);
      setState(() {});
      return;
    }
    if (!mounted) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 125),
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
              "Login 🔒",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            )
          ]),
          const SizedBox(height: 225),
          Column(
            children: [
              TextButton(
                onPressed: _authenticateWithBiometrics,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text('Use Fingerprint'),
                    SizedBox(width: 10),
                    Icon(Icons.fingerprint),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: _authenticate,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text('Use PIN/Password/Pattern'),
                    SizedBox(width: 10),
                    Icon(Icons.perm_device_information),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
