import flet as ft

from flet_desktop_drop import DropZone


def main(page: ft.Page):
    page.vertical_alignment = ft.MainAxisAlignment.CENTER
    page.horizontal_alignment = ft.CrossAxisAlignment.CENTER

    page.add(DropZone(
        content=ft.Container(height=400, width=400, bgcolor=ft.colors.AMBER_100),
        on_dropped=lambda e: page.add(ft.Text(f"Files dropped: {e.files}")),
        on_entered=lambda e: page.add(ft.Text("Files entered")),
        on_exited=lambda e: page.add(ft.Text("Files exited")),
    ))


ft.app(main)
