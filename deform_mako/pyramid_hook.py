"""integration code for pyramid"""
from pkg_resources import resource_filename
from pyramid.threadlocal import get_current_request
from pyramid.i18n import get_localizer

from translationstring import TranslationStringFactory

import deform
import factory

def translator(term, domain='deform'):
    """hooks into pyramid's translation infrastructure to translate `term`"""
    if not hasattr(term, 'interpolate'): # not a translation string
        term = TranslationStringFactory(domain)(term)
    return get_localizer(get_current_request()).translate(term)

def install():
    """actually turn-on mako rendering for deform"""
    # find the templates
    mako_template_dir = resource_filename('deform_mako', 'templates/')

    # this bit actually tells deform to use mako from now on
    deform.Form.set_default_renderer(
        # @@ send in more config here?
        factory.mako_renderer_factory(
            mako_template_dir,
            translator=translator,
            )
        )

def run(global_config, **settings):
    """hook for wsgi"""
    from deformdemo.app import run
    install()
    return run(global_config, **settings)
