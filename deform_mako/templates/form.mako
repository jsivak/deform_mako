# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
from webhelpers2.html.builder import HTML
%>
<%
rndr = field.renderer
tmpl = field.widget.item_template
start_form = tags.form(field.action,
                       method=field.method,
                       multipart=True,
                       id=field.formid,
                       class_=field.css_class,
                       **{'accept-charset':"utf-8", 'i18n:domain="deform"'},
                       )
%>
${start_form}
<fieldset class="deform-form-fieldset">
    % if field.title:
    <legend>${_(field.title)}</legend>
    % endif

    ${tags.hidden("_charset_", id=None, value=None)}
    ${tags.hidden("__formid__", id=None, value=field.formid)}

        % if field.error:
        <div class="alert alert-danger">
            <div class="error-msg-lbl" i18n:translate="">${_("There was a problem with your submission")}</div>
            <div class="error-msg-detail" i18n:translate="">${_("Errors have been highlighted below")}</div>
            <p class="error-msg" i18n:translate="">${field.errormsg}</p>
        </div>
        % endif

        % if field.description:
            <p class="section first">${_(field.description)}</p>
        % endif

        % for f in field.children:
            <div>
            ${rndr(tmpl, field=f, cstruct=cstruct.get(f.name, null))}
            </div>
        % endfor

        <div class="form-group deform-form-buttons">
% for button in field.buttons:
<%
if button.start:
    button_disposition = 'btn-primary'
else:
    button_disposition = 'btn-default'
if button.css_class:
    button_css = 'btn {0}'.format(button.css_class)
else:
    button_css = 'btn {0}'.format(button_disposition)
button_tag = HTML.tag('button', span_tag,
                      name=button.name,
                      type=button.type,
                      value=_(button.value),
                      disabled=button.disabled or None,
                      id=field.formid+button.name,
                      class_=button_css,
                      _closed=False,
                      )
%>\
          ${button_tag}
          HTML.tag('i', class=button.icon)
          ${button_title}
          % HTML.tag('/button', _closed=False)
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
       var extra_options = ${ajax_options} || {};
       $('#' + oid).ajaxForm($.extend(options, extra_options));
     }
   );
</script>
% endif
${tags.end_form()}
