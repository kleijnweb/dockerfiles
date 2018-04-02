#!/usr/bin/env bash
set -eu -o pipefail
. ./pretty.sh

for f in */*.Dockerfile; do
  basename=$(basename ${f})
  tag="kleijnweb/$(dirname ${f}):${basename%.*}"
  {
    print_color "cyan" "Building ${tag}"
    docker build php -f ${f} -t ${tag}
    print_em "Pushing ${tag}"
    docker push ${tag}
  } &
done

wait
