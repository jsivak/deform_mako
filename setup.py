import os

from setuptools import setup
from setuptools import find_packages

here = os.path.abspath(os.path.dirname(__file__))

try:
    README = open(os.path.join(here, 'README.rst')).read()
    CHANGES = open(os.path.join(here, 'CHANGES.rst')).read()
except:
    README = ''
    CHANGES = ''

requires = ['deform>=0.9.0']

setupkw = dict(
    name='deform_mako',
    version='0.1',
    description='Mako templates for Deform widgets',
    long_description=README + '\n\n' + CHANGES,
    classifiers=[
        "Intended Audience :: Developers",
        "Programming Language :: Python",
        ],
    keywords='web forms form generation schema validation',
    author="Matt Feifarek",
    author_email="matt.feifarek@gmail.com",
    url="https://github.com/mfeif/deform_mako",
    license="BSD-derived (http://www.repoze.org/LICENSE.txt)",
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    install_requires=requires,
    entry_points = """\
    [paste.app_factory]
    demo = deform_mako.pyramid_hook:run
    """,
    )

setup(**setupkw)
