import 'package:flutter/material.dart';

class DropDownButton extends StatelessWidget {
  DropDownButton({required this.items, super.key});
  List<DropdownMenuItem<String>>? items = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
      ),
      child: DropdownButton(items: items, onChanged: (value) {}),
    );
  }
}
