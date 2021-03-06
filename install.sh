#!/bin/sh -Cu

ln -sf "${PWD}/etc/git/"* "${XDG_CONFIG_HOME}/git"

for ext in bin/git-*; do
	if [ -x "${ext}" ]; then
		ln -sf "${PWD}/${ext}" "${WRKDIR}/bin"
	fi
done

git config --global commit.template "${XDG_CONFIG_HOME}/git/message"
git config --global --replace-all core.attributesFile "${XDG_CONFIG_HOME}/git/attributes"
git config --global core.excludesFile "${XDG_CONFIG_HOME}/git/excludes"
git config --global core.hooksPath "${XDG_CONFIG_HOME}/git/hooks"
