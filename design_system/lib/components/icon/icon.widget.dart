import '../icon/icon.style.dart';
import 'package:flutter/widgets.dart';
import '../icon/icon.props.dart';

class DSIconWidget extends StatelessWidget {

  DSIconWidget({
    super.key,
    required DSIcons icon,
    DSIconSize? size
  }) : props = DSIconProps(
      icon: icon,
      size: size
  );

  final DSIconProps props;

  @override
  Widget build(BuildContext context) {
    final iconStyle = DSIconStyle();

    return Image(
      image: AssetImage(
          iconStyle.correctPath(props.icon, props.size),
      ),
      key: key,
    );
  }

}

