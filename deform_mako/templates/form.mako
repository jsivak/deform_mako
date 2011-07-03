# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
from webhelpers.html.builder import HTML
%>
<%
rndr = field.renderer
tmpl = field.widget.item_template
start_form = tags.form(field.action,
                       method=field.method,
                       multipart=True,
                       id=field.formid,
                       class_=field.css_class,
                       **{'accept-charset':"utf-8"}
                       )
%>
${start_form}
  <fieldset class="deformFormFieldset">
    % if field.title:
    <legend>${_(field.title)}</legend>
    % endif

    ${tags.hidden("_charset_", id=None, value=None)}
    ${tags.hidden("__formid__", id=None, value=field.formid)}
    <ul>
      % if field.error:
      <li class="errorLi">
        <h3 class="errorMsgLbl">${_("There was a problem with your submission")}</h3>
        <p class="errorMsg">${_("Errors have been highlighted below")}</p>
      </li>
      % endif
      % if field.title:
      <li class="section first">
        <h3>${_(field.title)}</h3>
        % if field.description:
        <div>${_(field.description)}</div>
        % endif
      </li>
      % endif
      % for f in field.children:
      ${rndr(tmpl, field=f, cstruct=cstruct.get(f.name, null))}
      % endfor
      <li class="buttons">
% for button in field.buttons:
<%
span_tag = HTML.tag('span', _(button.title))
button_tag = HTML.tag('button', span_tag,
                      name=button.name,
                      type=button.type,
                      value=_(button.value),
                      disabled=button.disabled or None,
                      id=field.formid+button.name,
                      class_="btnText submit"
                      )
%>\
          ${button_tag}
% endfor
      </li>
    </ul>
  </fieldset>

% if field.use_ajax:
<script type="text/javascript">
  deform.addCallback(
     '${field.formid}',
     function(oid) {
         var options = {
           target: '#' + oid,
           replaceTarget: true,
         };
         var extra_options = ${field.ajax_options};
         var name;
         if (extra_options) {
           for (name in extra_options) {
             options[name] = extra_options[name];
           };
         };
         $('#' + oid).ajaxForm(options);
   });
</script>
% endif
${tags.end_form()}
