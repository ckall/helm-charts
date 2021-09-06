{{/*
Create the name of the service account to use
*/}}
{{- define "zipkin.dependencies.serviceAccountName" -}}
{{- if .Values.dependencies.serviceAccount.create -}}
    {{ default (include "zipkin.dependencies.fullname" .) .Values.dependencies.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.dependencies.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
dependencies name
*/}}
{{- define "zipkin.dependencies.fullname" -}}
{{- printf "%s-%s" (include "zipkin.fullname" .) "dependencies" -}}
{{- end -}}


{{/*
dependencies labels
*/}}
{{- define "zipkin.dependencies.labels" -}}
app.kubernetes.io/component: dependencies
app.kubernetes.io/version: {{ .Values.dependencies.image.tag | quote }}
{{ include "zipkin.common.labels" . }}
{{- end -}}
