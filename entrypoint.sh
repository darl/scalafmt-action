#!/bin/sh -l
set -e

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}/${INPUT_WORKDIR}" || exit
fi

echo "Current dir: ${pwd}"
echo "Current dir listing: ${ls -la}"

/scalafmt --mode "${INPUT_MODE}" --config "${INPUT_CONFIG}" .

git status