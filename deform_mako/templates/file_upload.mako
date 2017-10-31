# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
%>
<%
tag = tags.file("upload",
                id=field.oid,
                style=field.widget.style,
                accept=field.widget.accept,
                class_=field.widget.css_class,
                data_filename=cstruct.get('filename'),
                )
%>
${field.start_mapping()}
${tag}
% if cstruct.get('uid'):
  ${tags.hidden("uid", value=cstruct['uid'])}
% endif
<script type="text/javascript">
  deform.addCallback('${field.oid}', function (oid) {
  $('#' + oid).upload();
});
</script>
${field.end_mapping()}
