import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String hint,
  required TextStyle textStyle,

  // Callbacks
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  VoidCallback? onTap,

  // Password
  bool isPassword = false,

  // Validation
  String? Function(String?)? validate,

  // Icons
  required Widget prefix,
  Widget? suffix,
  VoidCallback? suffixPressed,

  // Layout
  int maxLines = 1,
  double bottomPadding = 0,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: bottomPadding),
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: const Color.fromARGB(255, 211, 211, 211),

          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.only(top: 10.0), child: prefix),
          const SizedBox(width: 7),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: type,
              obscureText: isPassword,
              onFieldSubmitted: onSubmit,
              onChanged: onChange,
              onTap: onTap,
              validator: validate,
              maxLines: maxLines,
              style: textStyle,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                border: InputBorder.none,
                suffixIcon: suffix != null
                    ? IconButton(icon: suffix!, onPressed: suffixPressed)
                    : null,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
