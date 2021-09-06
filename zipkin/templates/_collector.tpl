{{/*
Create the name of the service account to use
*/}}
{{- define "zipkin.collector.serviceAccountName" -}}
{{- if .Values.collector.serviceAccount.create -}}
    {{ default (include "zipkin.collector.fullname" .) .Values.collector.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.collector.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Collector name
*/}}
{{- define "zipkin.collector.fullname" -}}
{{- printf "%s-%s" (include "zipkin.fullname" .) "collector" -}}
{{- end -}}

{{/*
Collector service address
*/}}
{{- define "zipkin.collector.service.uri" -}}
{{- printf "http://%s:%d" (include "zipkin.collector.fullname" .) (.Values.collector.service.port | int ) -}}
{{- end -}}

{{/*
Collector labels
*/}}
{{- define "zipkin.collector.labels" -}}
app.kubernetes.io/component: collector
app.kubernetes.io/version: {{ .Values.collector.image.tag | default .Chart.AppVersion | quote }}
{{ include "zipkin.common.labels" . }}
{{- end -}}


{{/*
Collector Selector labels
*/}}
{{- define "zipkin.collector.selectorLabels" -}}
app.kubernetes.io/component: collector
{{ include "zipkin.common.selectorLabels" . }}
{{- end -}}
