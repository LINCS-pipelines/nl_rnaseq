FROM rocker/rstudio-stable:3.4.0

COPY ./process_neurolincs_data.R /home/rstudio/
RUN apt-get update -qq && \
    apt-get install -y \
    zlib1g-dev \
    libssh2-1-dev \
    libxml2-dev \
    curl \
    libpng-dev \
    sudo \
    wget

RUN R -e "install.packages(c('devtools'), repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages(c('readxl'), repos = 'http://cran.us.r-project.org')"
RUN R -e "devtools::install_github('schurerlab/LINCSDataPortal', force=TRUE)"

RUN R -e "source('https://bioconductor.org/biocLite.R'); biocLite('DESeq2', ask=FALSE); "
