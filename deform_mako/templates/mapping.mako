# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
from webhelpers2.html.builder import HTML
%>
<%
rndr = field.renderer
tmpl = field.widget.item_template
%>
${HTML.tag('div', title=field.description, class_="panel panel-default", _close=False)}
    ${HTML.tag('div', title=field.title, class_="panel-heading")}
        <div class="panel-body">
        % if field.errormsg:
            <div class="clearfix alert alert-danger">
                <p i18n:translate=''>There was a problem with this section</p>
                <p>${field.errormsg}</p>
            </div>
        % endif

        % if field.description:
        <div>${field.description}</div>
        % endif

        ${tags.hidden("__start__", value=field.name+":mapping", id=None)}
        % for f in field.children:
        ${rndr(tmpl, field=f, cstruct=cstruct.get(f.name, null))}
        % endfor
        ${tags.hidden("__end__", value=field.name+":mapping", id=None)}
    ${HTML.tag('/div', _closed=False)}
${HTML.tag('/div', _closed=False)}
