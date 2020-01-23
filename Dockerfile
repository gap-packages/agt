FROM gapsystem/gap-docker

COPY --chown=1000:1000 . $HOME/agt

RUN sudo pip3 install ipywidgets RISE

RUN jupyter-nbextension install rise --user --py

RUN jupyter-nbextension enable rise --user --py

USER gap

WORKDIR $HOME/agt
