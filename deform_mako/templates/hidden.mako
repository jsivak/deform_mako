# -*- coding: utf-8 -*-
<%!
from webhelpers.html import tags
%>
<%
tag = tags.hidden(field.name,
                  value=cstruct,
                  id=field.oid
                  )
%>
${tag}

