import 'package:flutter/material.dart';

class CustomElevatedBtn extends StatelessWidget {
  final Function()? onPressed;
  final String? label;
  final bool? isLoading;

  const CustomElevatedBtn(
      {super.key,
      required this.onPressed,
      required this.label,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF58BDBD),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: isLoading == true ? null : onPressed,
          child: isLoading == true
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  '$label',
                  style: const TextStyle(
                      color: Colors.white, fontSize: 16, height: 3),
                )),
    );
  }
}
