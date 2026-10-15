# {{ .Title }}

Source: {{ .Permalink }}
{{ with .Date }}Published: {{ .Format "2006-01-02" }}
{{ end }}{{ with .Params.tags }}{{ delimit . ", " }}
{{ end }}
{{ .RenderShortcodes | strings.TrimSpace }}
