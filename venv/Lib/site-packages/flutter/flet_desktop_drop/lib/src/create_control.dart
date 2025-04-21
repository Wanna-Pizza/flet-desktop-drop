import 'package:flet/flet.dart';

import 'flet_desktop_drop.dart';

CreateControlFactory createControl = (CreateControlArgs args) {
  switch (args.control.type) {
    case "dropzone":
      return DropZoneControl(
          parent: args.parent,
          control: args.control,
          children: args.children,
          parentDisabled: args.parentDisabled,
          parentAdaptive: args.parentAdaptive,
          backend: args.backend);
    default:
      return null;
  }
};

void ensureInitialized() {
  // nothing to initialize
}
