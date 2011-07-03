# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<%
yeartag = tags.text('year',
                value=year,
                id=field.oid,
                size=field.widget.size,
                class_=field.widget.css_class)
monthtag = tags.text('month',
                value=month,
                id=field.oid+"-month",
                size=field.widget.size,
                class_=field.widget.css_class)
daytag = tags.text('day',
                value=day,
                id=field.oid+"-day",
                size=field.widget.size,
                class_=field.widget.css_class)
%>
${tags.hidden("__start__", value=field.name+":mapping", id=None)}
<ul class="inline">
  <li>
    <label for="${field.oid}">Year</label>
    ${yeartag}
  </li>
  <li>
    <label for="${field.oid}-month">Month</label>
    ${monthtag}
  </li>
  <li>
    <label for="${field.oid}-day">Day</label>
    ${daytag}
  </li>
</ul>
${tags.hidden("__end__", value=field.name+":mapping", id=None)}

