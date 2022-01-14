import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final void Function()? onpressed;

  const ButtonWidget({
    Key? key,
    required this.buttonName,
    this.onpressed,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
          alignment: Alignment.center,
          height: 48,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.green,
          ),
          child: Text(buttonName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700))),
    );
  }
}
