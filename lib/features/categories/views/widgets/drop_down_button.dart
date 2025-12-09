import 'package:flutter/material.dart';

class DropDownButton<T> extends StatelessWidget {
  const DropDownButton({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  final List<DropdownMenuItem<T>> items;
  final T value;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
      ),
      child: DropdownButton<T>(
        iconDisabledColor: Colors.white,
        iconEnabledColor: Colors.white,
        iconSize: 30,
        elevation: 10,
        isExpanded: true,
        padding: EdgeInsets.only(left: 16),
        dropdownColor: Colors.black,
        value: value,
        underline: SizedBox(),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
