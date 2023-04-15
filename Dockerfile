FROM rocker/verse:4.1.3

# set up renv
ENV RENV_VERSION 0.17.3
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

WORKDIR /project
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv renv

RUN pwd
RUN ls -alh *

RUN Rscript -e "renv::restore()"

WORKDIR /home/rstudio/my_project_docker_copy
COPY . /home/rstudio/my_project_docker_copy
RUN Rscript -e "rmarkdown::render('my_report.Rmd')"