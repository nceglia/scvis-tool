FROM nceglia/base-r-scrna:latest

MAINTAINER Nicholas Ceglia <nickceglia@gmail.com>

RUN pip install tensorflow
RUN pip install PyYAML
RUN pip install matplotlib
RUN pip install pandas
RUN mkdir /results
RUN git clone https://github.com/shahcompbio/scvis.git /codebase/scvis/
RUN chmod -R 777 /codebase/scvis
RUN cd /codebase/scvis && python setup.py install

COPY run_scvis.py /codebase/run_scvis.py

CMD ["/bin/bash"]
