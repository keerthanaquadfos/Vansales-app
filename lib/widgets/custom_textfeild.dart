import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const CustomTextField(
      {required this.controller, required this.text, super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: signinTheamColor1,
              ),
            ),
            label: Text(widget.text),
          ),
        ));
  }
}

class LargeCustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const LargeCustomTextField(
      {required this.controller, required this.text, super.key});

  @override
  State<LargeCustomTextField> createState() => _LargeCustomTextFieldState();
}

class _LargeCustomTextFieldState extends State<LargeCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: TextField(
          minLines: 5,
          maxLines: 5,
          maxLength: 10,
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: signinTheamColor1,
              ),
            ),
            label: Text(widget.text),
          ),
        ));
  }
}

class CustomTextFieldOnlyNumber extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const CustomTextFieldOnlyNumber(
      {required this.controller, required this.text, super.key});

  @override
  State<CustomTextFieldOnlyNumber> createState() =>
      _CustomTextFieldOnlyNumberState();
}

class _CustomTextFieldOnlyNumberState extends State<CustomTextFieldOnlyNumber> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: signinTheamColor1,
              ),
            ),
            label: Text(widget.text),
          ),
        ));
  }
}

class CustomTextFielBox extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const CustomTextFielBox(
      {required this.controller, required this.text, super.key});

  @override
  State<CustomTextFielBox> createState() => _CustomTextFielBoxState();
}

class _CustomTextFielBoxState extends State<CustomTextFielBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: signinTheamColor1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: signinTheamColor1,
              ),
            ),
            label: Text(widget.text),
          ),
        ));
  }
}

//  const Padding(
//                 padding: EdgeInsets.only(bottom: 5),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black12),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: signinTheamColor1),
//                     ),
//                     label: Text.rich(
//                       TextSpan(
//                         children: <InlineSpan>[
//                           WidgetSpan(
//                             child: Text(
//                               'Place',
//                             ),
//                           ),
//                           WidgetSpan(
//                             child: Text(
//                               '*',
//                               style: TextStyle(color: signinTheamColor1),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),