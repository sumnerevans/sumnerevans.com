{{- $src := .Get "src" -}}
{{- $u := urls.Parse $src -}}
{{- with .Page.Resources.Get $u.Path -}}
  {{- $src = .Permalink -}}
{{- end -}}
[Watch video]({{ $src }})
