
## onchainR <br><img src="man/figures/onchainR.png" align="right" height="210" />

<!-- badges: start 
[![R-CMD-check](https://github.com/brandonleekramer/onchainR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/brandonleekramer/onchainR/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/brandonleekramer/onchainR/branch/main/graph/badge.svg)](https://app.codecov.io/gh/brandonleekramer/tidyweb3?branch=main)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/onchainR)](https://cran.r-project.org/package=ggplot2)
badges: end -->

`onchainR` is a package for accessing blockchain and web3 data in R

**Authors:** [Brandon Kramer](https://www.brandonleekramer.com/) \|
**License:** [MIT](https://opensource.org/licenses/MIT)<br/>

## Installation

You can install the development version of onchainR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("brandonleekramer/onchainR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library("onchainR") 

vitalik_eth = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
my_rpc_provider = "https://eth-mainnet.rpc.grove.city/v1/"
my_api_key = grove_api_key

eth_get_balance(vitalik_eth, my_rpc_provider, grove_api_key, "ETH")
#> [1] 1085.514
```

## Functions, Chains, and Providers

<br><img src="man/figures/supported-functions.png" align="center" width=100% />
