echo -e "\n\n*** TEST ***\n\n"
cd ../work
$R -e 'library(testthat);testthat::test_dir("~#PROJECT#~/tests")'
