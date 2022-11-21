from gcc as build
RUN apt-get update && apt-get install -y git dosbox
ARG GIT_COMMIT=master
RUN git clone https://github.com/open-watcom/open-watcom-v2.git && \
    cd open-watcom-v2 && \
    git checkout $GIT_COMMIT
COPY ./setvars.sh ./open-watcom-v2/setvars.sh
RUN cd open-watcom-v2 && ./build.sh rel

from debian:stretch-slim as runtime
RUN apt-get update && apt-get install -y dosbox sudo
COPY --from=build /open-watcom-v2/rel /opt/watcom
ENV PATH="/opt/watcom/binl;$PATH"
COPY ./entrypoint.sh /entrypoint.sh
entrypoint ["/entrypoint.sh"]

