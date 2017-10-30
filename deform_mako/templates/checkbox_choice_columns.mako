# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
import math
%>
<%
css_class = field.widget.css_class
style = field.widget.style
oid = field.oid
inline = getattr(field.widget, 'inline', False)
center_point = math.ceil(len(field.widget.values)/2)
%>

% if inline:
<div class="checkbox" style="width: auto;">
% endif
${field.start_sequence()}
<table class="table table-sm" style="width: auto;">
% for (index, (value, title)) in enumerate(field.widget.values):
    <tr><td class="col-sm">
<label for="${oid}-${index}" class="${inline and 'checkbox-inline'}">
<%
tag = tags.checkbox("checkbox",
            value=value,
            id="%s-%s" % (field.oid, index),
            checked=(value in cstruct),
            class_=field.widget.css_class,
            style=style,
            type='checkbox',
            )
%>
    ${tag}
    ${title}
    </label>
</td>
<td class="col-sm">
    <label for="${oid}-${index+center_point}" class="${inline and 'checkbox-inline'}">
<%
try:
    value, title = field.widget.values[index + center_point]
    tag = tags.checkbox("checkbox",
                value=value,
                id="%s-%s" % (field.oid, index + center_point),
                checked=(value in cstruct),
                class_=field.widget.css_class,
                style=style,
                type='checkbox',
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
${field.end_sequence()}
% if inline:
</div>
% endif
