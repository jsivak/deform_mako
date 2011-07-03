# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<%
tag = tags.textarea(field.name, cstruct, id=field.oid)
%>
${tag}
<script language="javascript" type="text/javascript">
  deform.addCallback(
      '${field.oid}',
      function(oid) {
          tinyMCE.init({
          mode : 'exact',
          elements: oid,
          height: '${field.widget.height}',
          width: '${field.widget.width}',
          theme : '${field.widget.theme}',
          theme_advanced_resizing : true,
          theme_advanced_toolbar_align : 'left',
          theme_advanced_toolbar_location : 'top'
          });
      }
      );
</script>
