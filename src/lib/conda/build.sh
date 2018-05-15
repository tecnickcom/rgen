echo -e "\n\n*** BUILD ***\n\n"
cp LICENSE ~#PROJECT#~/
$R -e 'library(devtools);library(roxygen2);setwd("./~#PROJECT#~");document()'
$R CMD INSTALL --build ~#PROJECT#~
