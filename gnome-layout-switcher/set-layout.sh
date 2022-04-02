#!/bin/bash
gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell \
 --method org.gnome.Shell.Eval "imports.ui.status.keyboard.getInputSourceManager().inputSources[$1].activate()"
