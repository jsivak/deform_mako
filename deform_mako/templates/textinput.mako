# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<%
tag = tags.text(field.name,
                value=cstruct,
                id=field.oid,
                type='text',  # override for html5 inputs
                size=field.widget.size,
                class_=field.widget.css_class)
%>
${tag}
% if field.widget.mask:
<script type="text/javascript">
  deform.addCallback(
     '${field.oid}',
     function (oid) {
        $("#" + oid).mask("${field.widget.mask}",
                          {placeholder:"${field.widget.mask_placeholder}"});
     });
</script>
% endif
