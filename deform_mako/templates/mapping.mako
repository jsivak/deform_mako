# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
from webhelpers2.html.builder import HTML
%>
<div title="${field.description}" class="panel panel-info">
    <div class="panel-heading"><strong>${field.title}</strong></div>
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
        ${child.render_template(field.widget.item_template)}
      % endfor
      ${field.end_mapping()}
  </div> <!-- mapping panel-body -->
</div> <!-- mapping panel -->
