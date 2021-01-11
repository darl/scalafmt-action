#!/bin/sh -l
set -ex

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}/${INPUT_WORKDIR}" || exit
fi

echo "Base: $GITHUB_BASE_REF"
echo "Current dir: $(pwd)"
echo "Current dir listing:\n$(ls -la)"

/scalafmt --mode "${INPUT_MODE}" --diff-branch "${GITHUB_BASE_REF}" --config "${INPUT_CONFIG}" .

git status

git diff "${GITHUB_BASE_REF}"