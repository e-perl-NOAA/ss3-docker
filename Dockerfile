FROM rocker/rstudio

RUN sudo apt-get update && sudo apt-get install -y \
    make \
    gcc \
    g++ \ 
    cmake \
    clang \ 
    git \
&& sudo apt-get clean \
&& sudo rm -rf /var/lib/apt/lists/

# set CRAN repo to the RStudio mirror
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site

RUN R -e "R -e "install.packages(c('remotes', 'dplyr', 'ggplot2', 'data.table', 'magrittr', 'mvtnorm'), dependencies = TRUE)" \
&& R -e "remotes::install_github('r4ss/r4ss')" \
&& R -e "remotes::install_github('PIFSCstockassessments/ss3diags')" \
&& R -e "remotes::install_github('ss3sim/ss3sim')" \
