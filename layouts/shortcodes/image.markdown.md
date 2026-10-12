{{- $src := .Get "src" -}}
{{- $u := urls.Parse $src -}}
{{- with or (.Page.Resources.Get $u.Path) (resources.Get $u.Path) -}}
  {{- $src = .Permalink -}}
{{- end -}}
![{{ .Get "alt" | default "Image" }}]({{ $src }})
