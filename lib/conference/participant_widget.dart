import 'package:flutter/material.dart';

class ParticipantWidget extends StatelessWidget {
  final Widget child;
  final String? id;

  const ParticipantWidget({
    required this.child,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
