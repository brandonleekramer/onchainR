% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eth_chainId.R
\name{eth_chainId}
\alias{eth_chainId}
\title{Returns the currently configured chain id}
\usage{
eth_chainId(provider_url, api_key)
}
\arguments{
\item{provider_url}{The URL of a JSON-RPC provider such as Pocket Network, Infura, or Alchemy.}

\item{api_key}{The API key of the JSON-RPC provider.}
}
\value{
Returns the currently configured chain id
}
\description{
Returns the currently configured chain id
}
\examples{
my_provider_url = "https://mainnet.infura.io/v3/"
my_api_key = "04f25f82de3840e1afd524b62d6767c5"

eth_chainId(my_provider_url, my_api_key)

}
