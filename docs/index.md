# Introduction

FletDesktopDrop for Flet.

## Examples

```
import flet as ft

from flet_desktop_drop import FletDesktopDrop


def main(page: ft.Page):
    page.vertical_alignment = ft.MainAxisAlignment.CENTER
    page.horizontal_alignment = ft.CrossAxisAlignment.CENTER

    page.add(

                ft.Container(height=150, width=300, alignment = ft.alignment.center, bgcolor=ft.Colors.PURPLE_200, content=FletDesktopDrop(
                    tooltip="My new FletDesktopDrop Control tooltip",
                    value = "My new FletDesktopDrop Flet Control", 
                ),),

    )


ft.app(main)
```

## Classes

[FletDesktopDrop](FletDesktopDrop.md)


