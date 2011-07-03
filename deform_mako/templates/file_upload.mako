# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<%
tag = tags.file("upload",
                id=field.oid,
                type='text',  # override for html5 inputs
                size=field.widget.size,
                class_=field.widget.css_class)
%>
<div class="deformFileupload">
  ${tags.hidden("__start__", value=field.name+":mapping", id=None)}
  % if cstruct.get('uid'):
  <div class="deformReplaces">
    ${tags.hidden("uid", value=cstruct['uid'], id=field.oid+"-uid")}
    <span id="${field.oid}-filename">
    ${cstruct.get('filename')}
    </span>
  </div>
  % endif
  ${tag}
  ${tags.hidden("__end__", value=field.name+":mapping", id=None)}

</div>
