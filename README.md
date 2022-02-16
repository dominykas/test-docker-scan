# test-docker-scan

This experiment is intended to verify whether `docker scan` reports the vulnerabilities from just the base image, without actually inspecting them.

## Methodology

Testing four images:

- an `ubuntu:focal` pinned to an older SHA, with and without `apt-get upgrade`
- an `ubuntu:focal` pinned to the most recent SHA, with and without `apt-get upgrade`

## Results

| Image                           | Vulnerability summary                                     |
|---------------------------------|-----------------------------------------------------------|
| ubuntu-focal-202110             | Tested 93 dependencies for known issues, found 29 issues. |
| ubuntu-focal-202110-with-update | Tested 93 dependencies for known issues, found 26 issues. | 
| ubuntu-focal-202202             | Tested 93 dependencies for known issues, found 28 issues. |
| ubuntu-focal-202202-with-update | Tested 93 dependencies for known issues, found 26 issues. |
