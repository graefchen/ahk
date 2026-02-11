#Requires AutoHotkey v2.0
#SingleInstance Force

;  █▀▀ █░░ █ █▀█ █▄▄ █▀█ ▄▀█ █▀█ █▀▄
;  █▄▄ █▄▄ █ █▀▀ █▄█ █▄█ █▀█ █▀▄ █▄▀
; some function to work with the clipboard
; and mainly to delete the tracking from yt

#include url.ahk

changeLinks(DataType) {
	if(DataType != 1)
		return

	clipbord := A_Clipboard

	link := URL(clipbord)
	if(link == Error)
		return

	switch link.host
	{
		case "youtu.be":
			; removing the `si` element from yt to stop tracking,
			; manually doing it was to hard
			if (link.query.Has("si")) {
				link.query.Delete("si")
			}
			A_Clipboard := link.toString()
		default: ; Do nothing
	}
}

OnClipboardChange changeLinks