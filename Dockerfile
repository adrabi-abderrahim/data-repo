# syntax = docker/dockerfile:1.3
FROM jupyterhub/jupyterhub:5

RUN echo "From Custum Dockerfile"

# add git-credential helper
COPY ./docker/git-credential-env /usr/local/bin/git-credential-env
RUN git config --system credential.helper env

# add entrypoint

ENTRYPOINT ["jupyter"]

# Used for testing purpose in ports.py
EXPOSE 52000
