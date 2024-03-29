% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hex_to_eth.R
\name{hex_to_eth}
\alias{hex_to_eth}
\title{Converts hexidecimal value to ETH value}
\usage{
hex_to_eth(hex_value)
}
\arguments{
\item{hex_value}{A hexidecimal value}
}
\value{
A value corresponding to a ETH value.
}
\description{
Converts hexidecimal value to ETH value
}
\examples{
vitalik_eth = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
my_provider_url = "https://mainnet.infura.io/v3/"
my_api_key = "04f25f82de3840e1afd524b62d6767c5"

balance_as_hex = eth_getBalance(vitalik_eth, my_provider_url, my_api_key, "hexidecimal")

balance_as_eth = hex_to_eth(balance_as_hex)
balance_as_eth

}
