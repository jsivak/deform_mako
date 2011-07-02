# -*- coding: utf-8 -*-
<%!
from webhelpers.html import builder
%>
<input type="password" name="${field.name}" value="${cstruct}"
       % if field.widget.size:
       size="${field.widget.size}"
       % endif
       % if field.widget.css_class:
       class="${field.widget.css_class}"
       % endif
       id="${field.oid}"/>
