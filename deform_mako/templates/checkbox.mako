# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<%
tag = tags.checkbox(field.name,
                value=field.widget.true_val,
                id=field.oid,
                checked=(cstruct==field.widget.true_val),
                class_=field.widget.css_class)
%>
${tag}
