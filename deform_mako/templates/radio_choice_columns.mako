# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
import math
%>
<%
inline = getattr(field.widget, 'inline', False)
center_point = math.ceil(len(field.widget.values)/2)
%>
% if inline:
<div>
% endif
${field.start_rename()}
    <table class="table table-sm" style="width: auto;">
    % for (index, (value, title)) in enumerate(field.widget.values):
        <tr><td class="col-sm">
        ##% if not inline:
        ##<div class='radio'>
        ##% endif
        <label for="${field.oid}-${index}" class="${inline and 'radio-inline'}">
<%
tag = tags.radio(field.oid,
                 value=value,
                 id="%s-%s" % (field.oid, index),
                 class_=field.widget.css_class,
                 checked=(value==cstruct),
                 style=field.widget.style,
                 )
%>
            ${tag}
            ${title}
        </label>
    </td>
    <td class="col-sm">
        <label for="${field.oid}-${index+center_point}" class="${inline and 'radio-inline'}">
<%
try:
    value, title = field.widget.values[index + center_point]
    tag = tags.radio(field.oid,
                 value=value,
                 id="%s-%s" % (field.oid, index + center_point),
                 class_=field.widget.css_class,
                 checked=(value==cstruct),
                 style=field.widget.style,
                 )
except IndexError:
    tag = ''
    title = ''
    break
%>
            ${tag}
            ${title}
        </label>
    </td>
</tr>
% endfor
</table>
    ${field.end_rename()}

% if inline:
</div>
% endif
