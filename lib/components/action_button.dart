import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isPrimary = true,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: isPrimary
          ? ElevatedButton(
              onPressed: () => onTap(),
              child: Text(title),
            )
          : TextButton(
              onPressed: () => onTap(),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
    );
  }
}
