# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
${tags.hidden("__start__", value=field.name+":mapping", id=None)}
<ul>
  <li>
    <label for="${field.oid}">Password</label>
<%
tag = tags.password('value',
                value=cstruct,
                id=field.oid,
                size=field.widget.size,
                class_=field.widget.css_class)
%>
    ${tag}
  </li>
  <li>
    <label for="${field.oid}-confirm">Confirm Password</label>
<%
tag = tags.password('confirm',
                value=confirm,
                id=field.oid+"-confirm",
                size=field.widget.size,
                class_=field.widget.css_class)
%>
    ${tag}
  </li>
</ul>
${tags.hidden("__end__", value=field.name+":mapping", id=None)}
