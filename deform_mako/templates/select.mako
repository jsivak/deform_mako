# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<%
tag = tags.select(field.name, cstruct, field.widget.values,
                         id=field.oid,
                         class_=field.widget.css_class)
%>
${tag}

