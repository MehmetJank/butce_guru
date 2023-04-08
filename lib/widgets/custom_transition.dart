import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<dynamic> customTransition({
  required Widget child,
  required double start,
  required double end,
}) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(start, end),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
  );
}
