FROM ghcr.io/cse-labs/webvalidate:beta

# copy our json test files
USER root
COPY TestFiles/* /app/TestFiles/
RUN chown -R webv:webv /app
USER webv
