# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
from webhelpers2.html.builder import HTML
%>
<%
    structural = field.widget.hidden or field.widget.category=='structural'
    error_class = field.widget.error_class
    title = getattr(field.widget, 'title', '')
    hidden = field.widget.hidden
    category = field.widget.category
    structural = hidden or category == 'structural'
    required = field.required

    div_class="form-group {0} {1} {2}".format((field.error and 'has-error' or ''), (field.widget.item_css_class or ''), field.default_item_css_class())
%>
% if structural:
<div class="${div_class}" title="${field.description}" id="item-${field.oid}">
% endif

% if not structural:
    ${HTML.tag('label', field.title, for_=field.oid, class_="col-xs-6 control-label {0}".format(field.required and 'required' or ''), id="req-{0}".format(field.oid)) }
% endif

% if getattr(field.widget, 'input_prepend', None) or getattr(field.widget, 'input_append', None):
    <div class="input-group">
% endif
% if getattr(field.widget, 'input_prepend', None):
    <span class="input-group-addon">
        ${ getattr(field.widget, 'input_prepend', '') | n}
    </span>
% endif
    <span>
        ${field.serialize(cstruct).strip() | n}
    </span>
% if getattr(field.widget, 'input_prepend', None):
    <span class="input-group-addon">
        ${ getattr(field.widget, 'input_append', '') | n}
    </span>
% endif
% if getattr(field.widget, 'input_prepend', None) or getattr(field.widget, 'input_append', None):
</div>
% endif

% if field.error and not field.widget.hidden and not field.typ.__class__.__name__ == 'Mapping':
    % for index, msg in enumerate(field.error.messages()):
        <%
        errstr = 'error-%s' % field.oid
        pid = (index==0 and errstr) or ('%s-%s' % (errstr, index))
        %>
        <p id="${pid}" class="help-block">${msg}</p>
    % endfor
% endif

% if field.description and not field.widget.hidden:
    <p class="help-block">${field.description}</p>
% endif

% if structural:
</div>
% endif
