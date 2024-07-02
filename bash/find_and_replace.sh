#!/usr/bin/env bash
EXPR='s/line1\nline2/res/g'
# perl:
# -i # modifies files in-place
# -p # "autoPrint" - apply expression line by line, print it out (-n applies without printing)
# -e # provide expression instead of script
fd -0 -t f ".*.md" | xargs -0 perl -i -0pe "$EXPR"
