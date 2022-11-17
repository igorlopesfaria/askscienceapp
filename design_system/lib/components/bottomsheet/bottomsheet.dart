import '../icon/icon.dart';
import '../../core/token/token.dart';
import 'package:flutter/material.dart';

DSToken token = DSToken();

showDSBottomSheet(BuildContext context, Widget widget) {
  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(token.radius.lg)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Wrap(children: <Widget>[
        Column(children: [
          Padding(padding: EdgeInsets.only(top: token.spacing.xxxs)),
          DSIconWidget(icon: DSIcons.dragHandle),
          Padding(padding: EdgeInsets.only(top: token.spacing.sm)),
          widget
        ])
      ]);
    },
  );
}
