# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<ul class="deformSet">
    ${tags.hidden("__start__", value=field.name+":rename", id=None)}
    % for (index, (value, title)) in enumerate(field.widget.values):
        <li class="deformSet-item">
<%
tag = tags.radio(field.oid,
                 value=value,
                 id="%s-%s" % (field.oid, index),
                 class_=field.widget.css_class,
                 checked=(value==cstruct)
                 )
%>
          ${tag}
          <label for="${field.oid}-${index}">${title}</label>
        </li>
    % endfor
    ${tags.hidden("__end__", value=None, id=None)}
</ul>

