# The conf.in.py file serves to generate the conf.py file with CMake's variables
# that are surrounded by "@" at both ends replaced by their values that are set in CMake

import os
import sys

sys.path.append(os.path.abspath("."))

from typing import Any, Dict, List

def theme_options(theme: str) -> Dict[str, Any]:
    """Get the theme options dict for a given supported theme."""

    match theme:
        case "sphinx_book_theme":
            return {
                "show_navbar_depth": 1,
                "collapse_navigation": True,
                "repository_url": "https://github.com/boschglobal/doxysphinx",
                "use_repository_button": True,
                "use_edit_page_button": True,
                "repository_branch": "main",
                "home_page_in_toc": True,
            }
        case "sphinx_rtd_theme":
            return {
                "logo_only": False,
                'canonical_url': '',
                'analytics_id': '',  #  Provided by Google in your dashboard
                'display_version': True,
                'prev_next_buttons_location': 'bottom',
                'style_external_links': False,
                # Toc options
                'collapse_navigation': True,
                'sticky_navigation': True,
                'navigation_depth': 4,
                'includehidden': True,
                'titles_only': False
            }

project = "SharedLibChain"
author = "Mariusz Józef Hoppe"
copyright = "Copyleft"
html_show_copyright = False
needs_sphinx = "4.4.0"
source_suffix = [".rst", ".md"]
master_doc = "index"
language = "en"
primary_domain = "cpp"
highlight_language = "cpp"
templates_path = ["_templates"]
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]
# pygments_style = "sphinx"
html_theme = "sphinx_rtd_theme"
# html_theme = "sphinx_book_theme"
html_theme_options = theme_options(html_theme)
html_static_path = ["../External/Doxysphinx/"]
html_title = project
html_css_files = [f"{html_theme.replace('_', '-')}-custom.css"]

extensions = [
    # "sphinx_mdinclude"
    # "sphinx.ext.mathjax",
    # "sphinx.ext.ifconfig",
    # "sphinx.ext.autodoc",
    # "sphinx.ext.viewcode",
    # "myst_parser",
    # "matplotlib.sphinxext.plot_directive",
    # "sphinx.ext.duration",
    # "sphinx.ext.napoleon",
    # "sphinx.ext.graphviz",
    # "sphinx.ext.todo",
    # "sphinx_copybutton",
    # "sphinxcontrib.doxylink",
    # "sphinx.ext.inheritance_diagram",
    # "sphinx_design",
]

# Doxylink (note that the second parameter of the tuple indicates a path relative to
# the sphinx output home)
doxygen_root = "../../../Docs/DocsOut/doxygenForSphinx"
doxylink = {
    "demo": (
        f"{doxygen_root}/html/tagfile.xml",
        f"{doxygen_root}/html",
    ),
}
