# updated to reflect Minor Gordon's changes to this Dockerfile file
FROM ubuntu:latest as build
RUN apt-get update -q && \
    apt-get install -y -q \
    build-essential \
    bash-completion \
    git \
    cmake
RUN git clone --depth=1 https://github.com/revbayes/revbayes.git /revbayes
RUN cd /revbayes/projects/cmake/ && ./build.sh

FROM ubuntu:latest
COPY --from=build /revbayes/projects/cmake/rb /revbayes/
COPY --from=build /revbayes/projects/cmake/build/core/librb-core.a /revbayes/
COPY --from=build /revbayes/projects/cmake/build/revlanguage/librb-parser.a /revbayes/
COPY --from=build /revbayes/projects/cmake/build/libs/liblibs.a /revbayes/

ENTRYPOINT ["/revbayes/rb"]
