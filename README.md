# gcc_on_centos7


Download gcc and compile it on centos7 using github workflow.

DONE:

Check how long does it take to compile: about 2h
Check if artifact uploads work as expected
Check glibc version: centos can run
Use docker to compile
- Add ubuntu:20.04
- Add dpc++
- build the images at the same time
- rename the repo to cc_on_distro

TODO:

- Add clang
- Add more gcc version

## Draft

Image name: `cc_on_distro`
Image tag: `centos7_gcc_11.2.0`, `ubuntu2004_clang_13.0.0`,`ubuntu2004_dpcxx_2022.1.1.119`

The build matrix should be [distro] x [compiler] x [version]


## Memo

### DPCPP

https://github.com/oneapi-src/oneapi-ci


