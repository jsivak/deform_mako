# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
%>
<%
css_class = field.widget.css_class
style = field.widget.style
oid = field.oid
inline = getattr(field.widget, 'inline', False)
%>

% if inline:
<div class="checkbox">
% endif

${field.start_sequence()}
    % for (index, (value, title)) in enumerate(field.widget.values):
    % if not inline:
        <div class="checkbox">
    % endif
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
    % if not inline:
        </div>
    % endif
    % endfor

${field.end_sequence()}
% if inline:
</div>
% endif
