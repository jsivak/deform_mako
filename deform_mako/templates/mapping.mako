# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<%
rndr = field.renderer
tmpl = field.widget.item_template
%>
<fieldset class="deformMappingFieldset">
  <!-- mapping -->
  % if field.title:
  <legend>${_(field.title)}</legend>
  % endif
  <ul>
    % if field.errormsg:
    <li class="errorLi">
      <h3 class="errorMsgLbl">${_("There was a problem with this section")}</h3>
      <p class="errorMsg">${_(field.errormsg)}</p>
    </li>
    % endif
    % if field.description:
    <li class="section">
      <div>${_(field.description)}</div>
    </li>
    % endif
    ${tags.hidden("__start__", value=field.name+":mapping", id=None)}
    % for f in field.children:
    ${rndr(tmpl, field=f, cstruct=cstruct.get(f.name, null))}
    % endfor
    ${tags.hidden("__end__", value=field.name+":mapping", id=None)}
  </ul>
  <!-- /mapping -->
</fieldset>
