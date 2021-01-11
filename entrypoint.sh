#!/bin/sh -l
set -e

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}/${INPUT_WORKDIR}" || exit
fi

/scalafmt --mode "${INPUT_MODE}" --diff-branch "${GITHUB_BASE_REF}" --config "${INPUT_CONFIG}" .
