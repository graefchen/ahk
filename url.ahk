#Requires AutoHotkey v2.0

;  █░█ █▀█ █░░
;  █▄█ █▀▄ █▄▄
;
; a small script for parsing url's
;
; inspired and similar to the URL API class in JavaScript[1] while using the
; regex provided by Berners-Lee, et al.[2].
;
; [1]: https://developer.mozilla.org/en-US/docs/Web/API/URL_API
; [2]: https://www.rfc-editor.org/rfc/rfc3986#appendix-B
class URL {
	; Takes in an URL to parse it into a Object.
	__New(url) {
		try
		{
			this.url := url
			FoundPos := RegExMatch(url, "^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?", &URI)

			this.protocol := URI.2
			this.host := URI.4
			this.hostname := StrSplit(this.host, ":")[1]
			this.origin := (URI.1 . URI.3)
			this.pathname := URI.5

			this.query := Map()
			; search query stuff
			search := StrSplit(URI.7, "&")
			Loop search.Length {
				obj := StrSplit(search[A_Index], "=")
				this.query[obj[1]] := obj[2]
			}

			this.hash := URI.8

			this.href := url
		}
		; catch as e
		; throw Error(e, " is not a valid URL")
	}

	toString() {
		queryString := ""
		if (this.query.Count != 0) {
			queryArray := []
			For Key, Value in this.query {
				; MsgBox(Key . "=" . Value)
				queryArray.Push(Key . "=" . Value)
			}

			queryString := "?"
			for index, element in queryArray {
				queryString := queryString . element (index < queryArray.Length ? "&" : "")
			}
		}

		returnString := this.protocol . "://" . this.host . this.pathname . queryString . this.hash
		this.href := returnString
		return returnString
	}
}

; MsgBox URL("http://www.ics.uci.edu/pub/ietf/uri/#Related").toString()
; MsgBox URL("https://youtu.be/Yqz3h6RF_7I?si=DDjiHIJITx69cfSO").toString()