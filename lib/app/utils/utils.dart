import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomInputForm extends StatelessWidget {
  CustomInputForm({
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.prefixIconColor,
    required this.labelText,
    this.prefixIcon,
    this.isReadOnly = false,
    this.onTap,
    super.key,
  });

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String labelText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  bool isReadOnly = false;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        onTapOutside: (event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        cursorColor: Colors.white,
        readOnly: isReadOnly,
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        style: inputTextStyle(),
        decoration: InputDecoration(
          labelText:labelText,
          labelStyle: TextStyle(color: Colors.white,fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintStyle: inputHitTextStyle(),
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          enabledBorder:
              OutlineInputBorder(borderSide: const BorderSide(color: blueClr), borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: blueClr,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        onTap: onTap,
      ),
    );
  }
}

successDialog(BuildContext context, String? buttonText, bool barrierDismissible, VoidCallback? onTap) {
  return showDialog(
      builder: (context) => AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          title: Column(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Success",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Request success go home and pull down for refresh ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: CustomButton(
                  onTap: onTap,
                  buttonText: buttonText!,
                ),
              ),
            ],
          )),
      context: context);
}

errorDialog(BuildContext context, String? buttonText, bool barrierDismissible, VoidCallback? onTap) {
  return showDialog(
      builder: (context) => AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          backgroundColor: Colors.white,
          title: Column(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Failed",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Something wrong!! Please try again ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: CustomButton(
                  onTap: onTap,
                  buttonText: buttonText!,
                ),
              ),
            ],
          )),
      context: context);
}

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.buttonText, required this.onTap});

  VoidCallback? onTap;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xff4446e9), borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )));
  }
}

inputTextStyle() {
  return TextStyle(fontSize: 14, color: Colors.white);
}

inputHitTextStyle() {
  return TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal);
}

const Color blueClr = Color(0xff4446e9);
