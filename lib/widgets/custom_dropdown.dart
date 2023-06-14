import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

import '../utils/custom_colors.dart';

class CustemDropdown extends StatelessWidget {
  final double boxwidth;
  final int itemcount;
  final List<DropDownValueModel> itemlist;
  final String? texthint;
  const CustemDropdown({
    super.key,
    required this.boxwidth,
    required this.itemcount,
    required this.itemlist,
    this.texthint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 30,
        width: MediaQuery.of(context).size.width * boxwidth,
        child: DropDownTextField(
          textFieldDecoration: InputDecoration(
            hintText: texthint,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: signinTheamColor1),
            ),
          ),
          clearOption: true,
          enableSearch: true,
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
          dropDownItemCount: itemcount,
          dropDownList: itemlist,
          onChanged: (val) {},
        ),
      ),
    );
  }
}
