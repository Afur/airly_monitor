import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<T?> showCupertinoModal<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool enableDrag = false,
}) {
  return CupertinoScaffold.showCupertinoModalBottomSheet(
    expand: true,
    context: context,
    enableDrag: enableDrag,
    backgroundColor: Colors.transparent,
    builder: builder,
  );
}

Route<T> modalsPageRoute<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return CupertinoModalBottomSheetRoute(
    expanded: true,
    settings: page,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (_) => child,
  );
}
