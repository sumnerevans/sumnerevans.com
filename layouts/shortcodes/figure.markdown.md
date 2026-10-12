{{- $src := .Get "src" -}}
{{- $u := urls.Parse $src -}}
{{- with or (.Page.Resources.Get $u.Path) (resources.Get $u.Path) -}}
  {{- $src = .Permalink -}}
{{- end -}}
{{- $alt := or (.Get "alt") (.Get "title") (.Get "caption") "Image" | plainify -}}
![{{ $alt }}]({{ $src }}){{ with .Get "caption" }}

{{ . | plainify }}{{ end }}
