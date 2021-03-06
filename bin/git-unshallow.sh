#!/bin/sh

git_unshallow() {
	fd -HI '^\.git$' |
		while read -r repo; do
			repo=$(dirname "${repo}")
			(
				cd "${repo}" &&
					[ -z "$(git status --porcelain=v1 2>/dev/null)" ] || echo "${repo}"
			)
		done
}
export MAIN=
