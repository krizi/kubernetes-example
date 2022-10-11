
{{- define "name" -}}
{{- if .Values.name -}}
{{ printf "%s" .Values.name }}
{{- else -}}
{{ printf "%s" .Release.Name }}
{{- end -}}
{{- end -}}


{{/*
Common labels
*/}}
{{- define "example.labels" -}}
helm.sh/chart: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}