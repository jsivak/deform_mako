# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
from webhelpers2.html.builder import HTML
%>
<%
start_form = tags.form(field.action,
                       method=field.method,
                       multipart=True,
                       id=field.formid,
                       class_=field.css_class,
                       **{'accept-charset':"utf-8"},
                       )
%>
${start_form}
<fieldset class="deform-form-fieldset">
    % if field.title:
    <legend>${field.title}</legend>
    % endif

    ${tags.hidden("_charset_", id=None, value=None)}
    ${tags.hidden("__formid__", id=None, value=field.formid)}

        % if field.error:
        <div class="alert alert-danger">
            <div class="error-msg-lbl">There was a problem with your submission</div>
            <div class="error-msg-detail">Errors have been highlighted below"</div>
            <p class="error-msg">${field.errormsg}</p>
        </div>
        % endif

        % if field.description:
            <p class="section first">${field.description}</p>
        % endif

        % for child in field.children:
            ${child.render()}
        % endfor

        <div class="form-group deform-form-buttons">

% for button in field.buttons:
<%
if getattr(button, 'start', None):
    button_disposition = 'btn-default'
else:
    button_disposition = 'btn-primary'
if button.css_class:
    button_css = 'btn {0}'.format(button.css_class)
else:
    button_css = 'btn {0}'.format(button_disposition)
button_tag = HTML.tag('button',
                      name=button.name,
                      type=button.type,
                      value=button.value,
                      disabled=button.disabled or None,
                      id=field.formid+button.name,
                      class_=button_css,
                      _closed=False,
                      )
%>\
          ${button_tag}
          % if getattr(button, 'icon', None):
            ${ HTML.tag('i', class_=getattr(button, 'icon', None)) }
            % endif
          ${button.title}
          ${ HTML.tag('/button', _closed=False) }
% endfor
        </div>
  </fieldset>

% if field.use_ajax:
<script type="text/javascript">
  deform.addCallback(
     '${field.formid}',
     function(oid) {
       var target = '#' + oid;
       var options = {
         target: target,
         replaceTarget: true,
         success: function() {
           deform.processCallbacks();
           deform.focusFirstInput(target);
         },
         beforeSerialize: function() {
           // See http://bit.ly/1agBs9Z (hack to fix tinymce-related ajax bug)
           if ('tinymce' in window) {
             $(tinymce.get()).each(
               function(i, el) {
                 var content = el.getContent();
                 var editor_input = document.getElementById(el.id);
                 editor_input.value = content;
             });
           }
         }
       };
       var extra_options = ${field.ajax_options} || {};
       $('#' + oid).ajaxForm($.extend(options, extra_options));
     }
   );
</script>
% endif
${tags.end_form()}
