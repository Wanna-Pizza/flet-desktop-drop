import 'package:flet/flet.dart';
import 'package:flutter/widgets.dart';
import 'package:desktop_drop/desktop_drop.dart';

class DropZoneControl extends StatefulWidget {
  final Control control;

  const DropZoneControl({super.key, required this.control});

  @override
  State<DropZoneControl> createState() => _DropZoneControlState();
}

class _DropZoneControlState extends State<DropZoneControl> with FletStoreMixin {
  bool _dragging = false;
  List<dynamic> _allowedFileTypes = [];

  List<dynamic> _droppedFiles = [];

  void sendEvent(String name, [dynamic data]) {
    widget.control.triggerEvent(name, data);
  }

  @override
  void initState() {
    super.initState();
    _allowedFileTypes =
        widget.control.get<List<String>>("allowed_file_types", const [])!;
  }

  void onDragDone() {
    sendEvent("dropped", {"files": _droppedFiles});
  }

  void onDragEntered() {
    sendEvent("entered");
  }

  void onDragExited() {
    sendEvent("exited");
  }

  @override
  Widget build(BuildContext context) {
    var content = widget.control.buildWidget("content");

    Widget? child = content;

    return withPageArgs((context, pageArgs) {
      Widget? dropZone;

      dropZone = DropTarget(
        onDragEntered: (details) {
          setState(() {
            _dragging = true;
          });
          onDragEntered();
        },
        onDragExited: (details) {
          setState(() {
            _dragging = false;
          });
          onDragExited();
        },
        onDragDone: (details) {
          setState(() {
            _droppedFiles =
                details.files.map((file) => file.path).where((filePath) {
              if (_allowedFileTypes.isEmpty) return true;

              final extension = filePath.split('.').last.toLowerCase();
              return _allowedFileTypes.contains(extension);
            }).toList();
            _dragging = false;
          });
          if (_droppedFiles.isNotEmpty) {
            onDragDone();
          }
        },
        child: child ?? const SizedBox(),
      );
      if (child == null) {
        return const ErrorControl(
            "The 'content' property is required for DropZoneControl.");
      }

      return ConstrainedControl(
        control: widget.control,
        child: dropZone,
      );
    });
  }
}
