# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<%
tag = tags.password(field.name,
                    value=cstruct,
                    id=field.oid,
                    size=field.widget.size,
                    class_=field.widget.css_class)
%>
${tag}
