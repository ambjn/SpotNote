import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationDialog extends StatelessWidget {
  InformationDialog({Key? key, this.radius = 8, required this.dialogData})
      : super(key: key);

  final double radius;
  var dialogData;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: SizedBox(
        height: 300,
        child: Column(children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 150)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return dialogData;
              },
            ),
          ),
          TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(radius),
                          bottomRight: Radius.circular(radius)))),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                  backgroundColor: MaterialStateProperty.all(Colors.teal)),
              onPressed: (() => Get.back()),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius))),
                alignment: Alignment.center,
                height: 35,
                width: double.infinity,
                child: const Text(
                  "OK",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ))
        ]),
      ),
    );
  }
}
