# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
%>
% if field.widget.inline:
<div>
% endif
${field.start_rename()}
    % for (index, (value, title)) in enumerate(field.widget.values):
        % if not field.widget.inline:
        <div class='radio'>
        % endif
        <label for="${field.oid}-${index}" class="${field.widget.inline and 'radio-inline'}">
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
        % if not field.widget.inline:
        <div class='radio'>
        % endif
    % endfor
    ${field.end_rename()}

% if field.widget.inline:
</div>
% endif
