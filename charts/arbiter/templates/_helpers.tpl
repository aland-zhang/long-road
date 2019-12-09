{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}

{{- define "scene.name" -}}
{{- default .Release.Name .Values.sceneName }}
{{- end -}}


{{- define "arbiter.name" -}}
{{- printf "%s-%s" (include "scene.name" .) "arbiter" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "arbiterConfig.name" -}}
{{-  (include "arbiter.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}