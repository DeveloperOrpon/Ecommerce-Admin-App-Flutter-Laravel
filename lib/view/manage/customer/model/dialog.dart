import 'package:flutter/cupertino.dart';

@pragma('vm:entry-point')
Route<Object?> infoDialog(BuildContext context, Object? arguments) {
  return CupertinoDialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Information'),
        content: Text('${arguments.toString()}'),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
@pragma('vm:entry-point')
Route<Object?> infoWithImageDialog(BuildContext context, Object? arguments) {
  List value=arguments as List;
  return CupertinoDialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Information'),
        content:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(arguments[0]),
            Text(arguments[1]),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

@pragma('vm:entry-point')
Route<Object?> deleteConfirmDialog(BuildContext context, Object? arguments,Function onTap) {
  return CupertinoDialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Information'),
        content: Text('${arguments.toString()}'),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              onTap();
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
        ],
      );
    },
  );
}
