#!/bin/sh

# Disable online searches (amazon products, etc)
gsettings set com.canonical.Unity.Lenses remote-content-search none
gsettings set com.canonical.Unity.Lenses disabled-scopes \
  "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope',
    'more_suggestions-populartracks.scope', 'music-musicstore.scope',
    'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope',
    'more_suggestions-skimlinks.scope']"
