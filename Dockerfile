# syntax = docker/dockerfile:1.3
FROM jupyterhub/jupyterhub:5

RUN echo "From Custum Dockerfile"

# install repo2docker
COPY --from=0 /tmp/wheelhouse /tmp/wheelhouse
RUN pip install --no-cache-dir --ignore-installed --no-deps /tmp/wheelhouse/*.whl \
 && pip list

# add git-credential helper
COPY ./docker/git-credential-env /usr/local/bin/git-credential-env
RUN git config --system credential.helper env

# add entrypoint
COPY ./docker/entrypoint /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]

# Used for testing purpose in ports.py
EXPOSE 52000
