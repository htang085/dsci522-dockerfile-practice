FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Copy the lock file
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Install dependencies using mamba
RUN mamba install --yes --quiet --name base --file /tmp/conda-linux-64.lock \
    && mamba clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"
