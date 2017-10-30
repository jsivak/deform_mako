# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
%>
<div class="checkbox">
    <label for="${field.oid}">
<%
tag = tags.checkbox(field.name,
                value=field.widget.true_val,
                id=field.oid,
                checked=(cstruct==field.widget.true_val),
                class_=field.widget.css_class,
                style=field.widget.style,
                )
%>
${tag}
% if hasattr(field, 'schema') and hasattr(field.schema, 'label'):
    <span class="checkbox-label">
    ${field.schema.label}
    </span>
%endif
</label>
</div>
