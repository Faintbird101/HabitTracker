// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.onPressed, required this.icon});

  final VoidCallback? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.primary,
      elevation: 4.0,
      child: IconButton(icon: icon, onPressed: onPressed,),
    );
  }
}
