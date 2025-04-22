import 'package:flet/flet.dart';
import 'package:flutter/cupertino.dart';

import 'flet_desktop_drop.dart';

class Extension extends FletExtension {
  @override
  Widget? createWidget(Key? key, Control control) {
    switch (control.type) {
      case "dropzone":
        return DropZoneControl(control: control);
      default:
        return null;
    }
  }
}
