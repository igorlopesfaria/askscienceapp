
import '../icon/icon.props.dart';

class DSIconStyle {

  String correctPath(DSIcons icon, DSIconSize? size) {
    String extension = ".png";

    if(size !=null && size == DSIconSize.sm) {
      extension = "_sm.png";
    } else if (size !=null && size == DSIconSize.md) {
      extension = "_md.png";
    }

    return "assets/icons/${icon.name}$extension";
  }

}