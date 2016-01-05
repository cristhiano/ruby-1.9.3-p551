FROM buildpack-deps:jessie

ENV RUBY_MAJOR 1.9

ENV RUBY_VERSION 1.9.3-p551

ENV RUBY_DOWNLOAD_SHA256 bb5be55cd1f49c95bb05b6f587701376b53d310eb1bb7c76fbd445a1c75b51e8

RUN curl -fSL -o ruby.tar.gz "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.gz"

RUN echo "$RUBY_DOWNLOAD_SHA256 *ruby.tar.gz" | sha256sum -c -

RUN mkdir -p /usr/src/ruby

RUN tar -xzf ruby.tar.gz -C /usr/src/ruby --strip-components=1

RUN rm ruby.tar.gz

WORKDIR /usr/src/ruby

RUN ./configure

RUN make

RUN make install

RUN rm -r /usr/src/ruby

CMD ["irb"]
