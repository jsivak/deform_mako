# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
from webhelpers2.html.builder import HTML
%>
<%
rndr = field.renderer
tmpl = field.widget.item_template
%>
here
${HTML.tag('div', title=field.description, class_="panel panel-default", _closed=False)}
here2
${HTML.tag('div', title=field.title, class_="panel-heading")}
here3
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
    field.children: <pre>${field.children}</pre>
    % for f in field.children:
        <div>
        ${f.render_template(field.widget.item_template)}
        ##${rndr(tmpl, field=f, cstruct=cstruct.get(f.name, null))}
        </div>
    % endfor
    ${field.end_mapping()}
${HTML.tag('/div', _closed=False)}
${HTML.tag('/div', _closed=False)}
