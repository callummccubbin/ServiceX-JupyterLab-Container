ARG BASE_CONTAINER=jupyter/minimal-notebook
FROM $BASE_CONTAINER
LABEL author=" "
USER root
RUN pip install pandas numpy ipywidgets matplotlib plotly servicex servicex_clients
USER $NB_UID
COPY ./demo1.ipynb /home/jovyan
COPY ./demo2.ipynb /home/jovyan
COPY ./README.md /home/jovyan