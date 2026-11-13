# The Switch 2 game-role loader, built in the Switch 2 devkit's image.
#   docker build --output out .           ->  out/main
#   docker build --target build -t hbloader-build .   (the build environment)
# DEVKIT_IMAGE is the devkit's image: build it from the devkit's Dockerfile, tagged
# ounce-devkit, or name another with --build-arg DEVKIT_IMAGE=...
ARG DEVKIT_IMAGE=ounce-devkit:latest
FROM ${DEVKIT_IMAGE} AS build
COPY . /src
WORKDIR /src/switch2
RUN make -j"$(nproc)" -f Makefile.clean

FROM scratch
COPY --from=build /src/build/clean/main /
