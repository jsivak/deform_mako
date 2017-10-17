# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
from webhelpers2.html.builder import HTML
%>
<%
    div_class="form-group {0} {1} {2}".format((field.error and 'has-error' or ''), (field.widget.item_css_class or ''), field.default_item_css_class())
%>
<div class=${div_class}, title=${field.description}, id="item-${field.oid}", i18n:domain="deform">
${HTML.tag('label', field.title, for_=field.oid, class_="control-label {0}".format(field.required), id="req-{0}".format(field.oid)) }

<div>
    <span class="input-group-addon">
        ${ getattr(field.widget, 'input_prepend', '') | n}
        ##${HTML.tag('span', getattr(field.widget, 'input_prepend', None), class_='input-group-addon')}
    </span>
    <span>
        ${field.serialize(cstruct).strip() | n}
    </span>
    <span class="input-group-addon">
        ${ getattr(field.widget, 'input_append', '') | n}
        ##${HTML.tag('span', getattr(field.widget, 'input_append', None), class_="input-group-addon")}
    </span>
</div>

% if field.error and not field.widget.hidden and not field.typ.__class__.__name__ == 'Mapping':
% for index, msg in enumerate(field.error.messages()):
<%
errstr = 'error-%s' % field.oid
pid = (index==0 and errstr) or ('%s-%s' % (errstr, index))
%>
    <p id="${pid}" i18n:translate="" class="${field.widget.error_class}">${msg}</p>
% endfor
% endif


% if field.description and not field.widget.hidden:
    <p class="help-block">${field.description}</p>
% endif
</div>
