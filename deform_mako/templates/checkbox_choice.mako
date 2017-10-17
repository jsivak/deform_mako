# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
%>
${tags.hidden("__start__", value=field.name+":sequence", id=None)}
  <ul class="deformSet">
    % for (index, (value, title)) in enumerate(field.widget.values):
    <li class="deformSet-item">
<%
tag = tags.checkbox("checkbox",
                value=value,
                id="%s-%s" % (field.oid, index),
                checked=(value in cstruct),
                class_=field.widget.css_class)
%>
      ${tag}
      <label for="${field.oid}-${index}">${title}</label>
    </li>
    % endfor
  </ul>
${tags.hidden("__end__", value=field.name+":sequence", id=None)}

