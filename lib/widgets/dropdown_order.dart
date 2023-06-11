import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class DropDownOrder extends StatefulWidget {
  const DropDownOrder({super.key});

  @override
  State<DropDownOrder> createState() => _DropDownOrderState();
}

class _DropDownOrderState extends State<DropDownOrder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width * .95,
            child: DropDownTextField(
              textFieldDecoration: const InputDecoration(
                hintText: 'Type ',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: signinTheamColor1),
                ),
              ),
              clearOption: false,
              enableSearch: false,
              clearIconProperty: IconProperty(
                color: signinTheamColor1,
              ),
              validator: (value) {
                if (value == null) {
                  return "Required field";
                } else {
                  return null;
                }
              },
              dropDownItemCount: 2,
              dropDownList: const [
                DropDownValueModel(name: 'Fresh', value: "fresh"),
                DropDownValueModel(name: 'Second', value: "second"),
              ],
              onChanged: (val) {},
            ),
          ),
        ],
      ),
    );
  }
}
