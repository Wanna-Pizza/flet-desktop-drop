from dataclasses import dataclass, field
from typing import Optional, Callable, Any

from flet.controls.adaptive_control import AdaptiveControl
from flet.controls.constrained_control import ConstrainedControl
from flet.controls.control import Control
from flet.controls.base_control import control
from flet.controls.alignment import Alignment
from flet.controls.control_event import ControlEvent
from flet.controls.types import OptionalControlEventCallable,OptionalEventCallable

import flet as ft

__all__ = ["DropZone", "DropEvent"]


@dataclass
class DropEvent(ControlEvent):
    files: Optional[list] = field(metadata={"data_field": "files"})


@control("dropzone")
class DropZone(ConstrainedControl, AdaptiveControl):
    """
    A control that allows dropping files.
    """
    content: Optional[Control] = None
    alignment: Optional[Alignment] = None
    on_dropped: OptionalEventCallable["DropEvent"] = None
    on_exited: OptionalControlEventCallable = None
    on_entered: OptionalControlEventCallable = None
    allowed_file_types: Optional[list] = field(default_factory=list)


