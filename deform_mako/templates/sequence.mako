# -*- coding: utf-8 -*-
<%!
from webhelpers2.html import tags
from webhelpers2.html.builder import HTML
from mako.runtime import UNDEFINED
%>
<%
min_len = field.widget.min_len or 0
max_len = field.widget.max_len or 100000
my_subfields = [x[1] for x in subfields]
now_len = len(subfields)
prototype = field.widget.prototype(field)
orderable = field.widget.orderable and 1 or 0
%>

<div class="deform-seq" id="${field.oid}">
<style>
    body.dragging, body.dragging * {
      cursor: move !important;
    }

    .dragged {
      position: absolute;
      opacity: 0.5;
      z-index: 2000;
    }
</style>

<!-- sequence -->
<input type="hidden" name="__start__"
    value="${field.name}:sequence"
    class="deform-proto"
    prototype="${field.widget.prototype(field)}"
/>

<div class="panel panel-info">
    <div class="panel-heading"><strong>${field.title}</strong></div>
    <div class="panel-body">
        <div class="deform-seq-container" id="${field.oid}-orderable">
            % for subfield in my_subfields:
                <div>
                    ## :TODO: changed for mail_details.py; not sure if it breaks other stuff
                    ##${subfield.render_template(subfield.widget.item_template, parent=field)}
                    ${subfield.render_template(field.widget.item_template, parent=field)}
                </div>
            % endfor
            <span class="deform-insert-before"
                min_len="${min_len}"
                max_len="${max_len}"
                now_len="${now_len}"
                orderable="${orderable}">
            </span>
        </div> <!-- deform-seq-container -->
    </div> <!-- panel-body -->
    <div class="panel-footer">
      <a href="#"
         class="btn deform-seq-add"
         id="${field.oid}-seqAdd"
         onclick="javascript: return deform.appendSequenceItem(this);">
        <small id="${field.oid}-addtext">${add_subitem_text}</small>
      </a>
      <script type="text/javascript">
       deform.addCallback(
         '${field.oid}',
         function(oid) {
           oid_node = $('#'+ oid);
           deform.processSequenceButtons(oid_node,
            ${min_len},
            ${max_len},
            ${now_len},
            ${orderable});
           }
         )
        % if field.widget.orderable:
            $( "#${field.oid}-orderable" ).sortable({
            handle: ".deform-order-button, .panel-heading",
            containerSelector: "#${field.oid}-orderable",
            itemSelector: ".deform-seq-item",
            placeholder: '<span class="glyphicon glyphicon-arrow-right placeholder"></span>',
            onDragStart: function ($item, container, _super) {
                var offset = $item.offset(),
                pointer = container.rootGroup.pointer

                adjustment = {
                left: pointer.left - offset.left,
                top: pointer.top - offset.top
                }

                _super($item, container)
            },
            onDrag: function ($item, position) {
                $item.css({
                    left: position.left - adjustment.left,
                    top: position.top - adjustment.top
                })
                }
            });
        % endif
      </script>

      <input type="hidden" name="__end__" value="${field.name}:sequence"/>
      <!-- /sequence -->
    </div>

  </div>
</div> 
