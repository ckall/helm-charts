{{/*
Create the name of the service account to use
*/}}
{{- define "zipkin.ui.serviceAccountName" -}}
{{- if .Values.ui.serviceAccount.create -}}
    {{ default (include "zipkin.ui.fullname" .) .Values.ui.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.ui.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
ui name
*/}}
{{- define "zipkin.ui.fullname" -}}
{{- printf "%s-%s" (include "zipkin.fullname" .) "ui" -}}
{{- end -}}


{{/*
ui labels
*/}}
{{- define "zipkin.ui.labels" -}}
app.kubernetes.io/component: ui
app.kubernetes.io/version: {{ .Values.ui.image.tag | default .Chart.AppVersion | quote }}
{{ include "zipkin.common.labels" . }}
{{- end -}}


{{/*
ui Selector labels
*/}}
{{- define "zipkin.ui.selectorLabels" -}}
app.kubernetes.io/component: ui
{{ include "zipkin.common.selectorLabels" . }}
{{- end -}}
