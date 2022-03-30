import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {


  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String dropdownValue = 'English';

  var items = [
    'English',
    'Hindi',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      underline: SizedBox(),
      style: TextStyle(
        color: Colors.black,
      ),
      icon: Icon(Icons.arrow_drop_down_sharp),
      iconSize: 36.0,
      isExpanded: true,
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
    );
  }
}
