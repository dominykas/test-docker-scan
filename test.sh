#!/usr/bin/env bash

set -e
mkdir -p results

for VARIANT in ubuntu-focal-202110 ubuntu-focal-202110-with-update ubuntu-focal-202202 ubuntu-focal-202202-with-update; do

  echo ================================== ${VARIANT}
  echo

  docker build -q -t test-scan:${VARIANT} -f Dockerfile.${VARIANT} .
  docker scan test-scan:${VARIANT} > results/docker-scan.${VARIANT}.txt || true
  snyk test --docker test-scan:${VARIANT} --file=Dockerfile.${VARIANT} > results/snyk-test.${VARIANT}.txt || true
  docker image rm test-scan:${VARIANT}

  echo
  echo
  echo
  echo
  echo

done
