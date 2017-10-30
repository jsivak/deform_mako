# -*- coding: utf-8 -*-
<%
    placeholder = str(getattr(field.widget, 'placeholder', ''))
%>
<style>
.select2-selection.form-control {
padding: 0px 0px;
}

.select2-container--default .select2-selection--multiple,
.select2-container--default .select2-selection--single {
border: 1px solid #ccc;
}

</style>
% if field.widget.multiple:
    <input type="hidden" name="__start__" value="${field.name}:sequence" />
% endif
<select
    name="${field.name}"
    id="${field.oid}"
    class="form-control ${field.widget.css_class or ''}"
    data-placeholder="${placeholder}"
    multiple="${field.widget.multiple}"
    style="${field.widget.style}">
    % for item in values:
        % if isinstance(item, field.widget.optgroup_class):
            <optgroup label="${item.label}">
            % for (value, description) in item.options:
                <option selected="${field.widget.get_selected_value(cstruct, value) or ''}"
                class="${field.widget.css_class or ''}"
                label="${field.widget.long_label_generator and description}"
                value="${value}">
                ${field.widget.long_label_generator and field.widget.long_label_generator(item.label, description) or description}
                </option>
            % endfor
            </optgroup>
        % else:
            <option
            % if field.widget.get_select_value(cstruct, item[0]):
                selected="${field.widget.get_select_value(cstruct, item[0])}"
            % endif
            % if field.widget.css_class:
                class="${field.widget.css_class}"
            % endif
            value="${item[0]}">
            ${item[1]}
            </option>
        % endif
    % endfor
</select>

<script type="text/javascript">
deform.addCallback(
    '${field.oid}',
    function(oid) {
    $('#' + oid).select2({
        containerCssClass: 'form-control',
        placeholder: "${placeholder.replace('"','\\"')}" || undefined,
        allowClear: "${hasattr(field.widget, 'placeholder')}"
    });
    }
);
</script>

% if field.widget.multiple:
    <input type="hidden" name="__end__" value="${field.name}:sequence"/>
% endif



