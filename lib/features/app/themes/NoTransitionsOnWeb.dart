import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Disabling navigation transitions on `Flutter web`
///
/// Navigation transitions occur when a user moves between pages,
/// and it can be a great way to let the user orient themselves in a mobile application.
/// However, for `web` applications, it’s not something you would typically see.
/// For a perceived performance improvement, you can disable the page transition animation.
///
/// By default, [MaterialApp] uses page transitions for routing relevant to the platform
///
/// To override this behavior, you can create your own [PageTransitionsTheme] class.
/// To detect when the application runs on the web, use the kIsWeb constant.
///
/// If it is on the `web`, disable the transition by returning the `child`
///
class NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
