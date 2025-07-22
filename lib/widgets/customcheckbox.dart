import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String label;
  final bool initialValue;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckbox({
    Key? key,
    required this.label,
    this.initialValue = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue ?? false;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          },
        ),
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium, // Use theme for text styling
        ),
      ],
    );
  }
}
