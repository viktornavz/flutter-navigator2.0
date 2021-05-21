import 'package:flutter/material.dart';
import 'package:ptj_ultra_web/resources/dimens/app_dimens.dart';

class InProgressMessage extends StatelessWidget {
  final String screenName;
  final String progressName;

  const InProgressMessage(
      {required this.progressName, required this.screenName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.SIZE_SPACING_MEDIUM),
        child: Text(
          '$progressName is in progress...\n\nStill in $screenName\n\n',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
