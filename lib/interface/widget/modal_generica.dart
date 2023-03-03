import 'package:flutter/material.dart';

class ModalGenerica {
  final BuildContext context;
  final String title;
  final String content;

  ModalGenerica({
    required this.context,
    required this.title,
    required this.content,
  });

  void show() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          title: Text(title),
          content: Text(content),
        ),
      );
}
