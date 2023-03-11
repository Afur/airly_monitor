import 'package:flutter/material.dart';

abstract class LifecycleAwareState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  void onResumed() {}
  void onPaused() {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResumed();
    } else if (state == AppLifecycleState.paused) {
      onPaused();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
