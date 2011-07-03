# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
from webhelpers.html.builder import HTML
%>
<%
rndr = field.renderer
tmpl = field.widget.item_template
item_tmpl = field.widget.item_template
min_len = field.widget.min_len or 0
max_len = field.widget.max_len or 100000
now_len = len(subfields)
prototype = field.widget.prototype(field)

start_tag = tags.hidden("__start__",
                        id=None,
                        value=field.name+":sequence",
                        class_="deformProto",
                        prototype=prototype)
end_tag = tags.hidden("__end__",
                      id=None,
                      value=field.name+":sequence")
span_insert_before = HTML.tag('span', '',
                              class_="deformInsertBefore",
                              min_len=min_len or None,
                              max_len=max_len or None,
                              now_len=now_len or None)
%>


<div class="deformSeq" id="${field.oid}">
<!-- sequence -->
${start_tag}
<ul>
% for c, f in subfields:
  ${rndr(item_tmpl, field=f, cstruct=c, parent=field)}
% endfor
  ${span_insert_before}
</ul>

<a href="#" class="deformSeqAdd" id="${field.oid}-seqAdd" onclick="javascript: return deform.appendSequenceItem(this);">\
<small id="${field.oid}-addtext">${_(add_subitem_text)}</small>\
</a>

<script type="text/javascript">
   deform.addCallback(
     '${field.oid}',
     function(oid) {
       oid_node = $('#'+ oid);
       deform.processSequenceButtons(oid_node, ${min_len}, ${max_len}, ${now_len});
     }
   )
</script>
${end_tag}
<!-- /sequence -->
</div>
