# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<%
tag = tags.text(field.name,
                value=cstruct,
                id=field.oid,
                type='date',
                size=field.widget.size,
                class_=field.widget.css_class)
%>
${tag}
<script type="text/javascript">
  deform.addCallback(
    '${field.oid}',
    function(oid) {
        $('#' + oid).datepicker({dateFormat: 'yy-mm-dd'});
    }
  );
</script>
