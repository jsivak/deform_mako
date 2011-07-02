"""framework-agnostic factory to make a mako renderer"""
import os
from mako.template import Template

def mako_renderer_factory(directory, translator=None):
    def mako_renderer(tname, **kw):
        filename = os.path.join(directory, tname) + '.mako'
        template = Template(filename=filename)  # @@ send in more config here?
        return template.render(_=translator, **kw)
    return mako_renderer

