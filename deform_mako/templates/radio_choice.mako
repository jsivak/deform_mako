# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
%>
<%
    inline = getattr(field.widget, 'inline', False)
%>
% if inline:
<div>
% endif
${field.start_rename()}
    % for (index, (value, title)) in enumerate(field.widget.values):
        % if not inline:
        <div class='radio'>
        % endif
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
        % if not inline:
        </div>
        % endif
    % endfor
    ${field.end_rename()}

% if inline:
</div>
% endif
