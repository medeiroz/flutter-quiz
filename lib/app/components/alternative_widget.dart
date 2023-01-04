import 'package:flutter/material.dart';

class AlternativeWidget extends StatelessWidget {
  final String alternative;
  final void Function(String alternative) onPressed;

  const AlternativeWidget(this.alternative, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed(alternative),
        child: Text(alternative),
      ),
    );
  }
}
