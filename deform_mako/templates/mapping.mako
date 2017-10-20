# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
from webhelpers2.html.builder import HTML
%>
<div title="${field.description}" class="panel panel-default">
  <div class="panel-heading">${field.title}</div>
    <div class="panel-body">
      % if field.errormsg:
          <div class="clearfix alert alert-danger">
              <p>There was a problem with this section</p>
              <p>${field.errormsg}</p>
          </div>
      % endif

      % if field.description:
      <div>${field.description}</div>
      % endif
      ${field.start_mapping()}
      % for child in field.children:
        <div>
        ${child.render_template(field.widget.item_template)}
        </div>
      % endfor
      ${field.end_mapping()}
    </div>
</div>
