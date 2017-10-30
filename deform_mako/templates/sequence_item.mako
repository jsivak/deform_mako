# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
%>
% if not field.widget.hidden:
<div title="${field.description}"
    class="form-group row deform-seq-item ${field.error and field.widget.error_class or ''} ${field.widget.item_css_class or ''} ${field.default_item_css_class()}">
% endif

    <div class="col-xs-11">
        ${field.serialize(cstruct)}
        % if field.error and not field.widget.hidden:
            % for index, msg in enumerate(field.error.messages()):
            <%
            errstr = 'error-%s' % field.oid
            pid = (index==0 and errstr) or ('%s-%s' % (errstr, index))
            %>
            <p id="${pid}" class="${field.widget.error_class} help-block">${msg}</p>
            % endfor
        % endif
    </div>
    <!-- sequence_item -->
    <div class="col-xs-1" style="padding:0">
        % if not field.widget.hidden:
            <span class="deform-order-button close glyphicon glyphicon-resize-vertical"
                id="${field.oid}-order"
                title="Remove (via drag and drop)"
                ></span>
            <a class="deform-close-button close"
                id="${field.oid}-close"
                title="Remove"
                onclick="javascript:deform.removeSequenceItem(this);">&times;</a>
        % endif
    </div>
    <!-- /sequence_item -->
% if not field.widget.hidden:
</div>
% endif
