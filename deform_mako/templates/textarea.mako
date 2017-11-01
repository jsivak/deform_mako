# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
%>
<%
tag = tags.textarea(field.name, cstruct,
                    id=field.oid,
                    rows=field.widget.rows,
                    cols=field.widget.cols,
                    class_=field.widget.css_class)
%>
${tag}
