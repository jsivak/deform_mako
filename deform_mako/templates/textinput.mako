# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
%>
<%
tag = tags.text(field.name,
                value=cstruct,
                id=field.oid,
                type_='text',  # override for html5 inputs
                class_="form-control {0}".format(field.widget.css_class),
                style=field.widget.style,
                )
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
