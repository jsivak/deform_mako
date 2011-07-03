# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
${tags.hidden("__start__", value=field.name+":mapping", id=None)}
<ul>
  <li>
    <label for="${field.oid}">${subject}</label>
<%
tag = tags.text('value',
                value=cstruct,
                id=field.oid,
                size=field.widget.size,
                class_=field.widget.css_class)
%>
    ${tag}
  </li>

  <li>
    <label for="${field.oid}-confirm">${confirm_subject}</label>
<%
tag = tags.text('confirm',
                value=confirm,
                id=field.oid+"-confirm",
                size=field.widget.size,
                class_=field.widget.css_class)
%>
    ${tag}
  </li>
</ul>
  % if field.widget.mask:
  <script type="text/javascript">
    deform.addCallback(
        '${field.oid}',
        function (oid) {
           $("#" + oid).mask("${field.widget.mask}",
                              {placeholder:"${field.widget.mask_placeholder}"});
           $("#" + oid + "-confirm").mask("${field.widget.mask}",
                              {placeholder:"${field.widget.mask_placeholder}"});
        }
        );

  </script>
  % endif

${tags.hidden("__end__", value=field.name+":mapping", id=None)}
