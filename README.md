
## onchainR <br><img src="man/figures/onchainR.png" align="right" height="220" />

<!-- badges: start 
[![R-CMD-check](https://github.com/brandonleekramer/onchainR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/brandonleekramer/onchainR/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/brandonleekramer/onchainR/branch/main/graph/badge.svg)](https://app.codecov.io/gh/brandonleekramer/tidyweb3?branch=main)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/onchainR)](https://cran.r-project.org/package=ggplot2)
badges: end -->

`onchainR` is a package for querying blockchain and web3 data in R

**Authors:** [Brandon Kramer](https://www.brandonleekramer.com/) \|
**License:** [MIT](https://opensource.org/licenses/MIT)<br/>

<br>

## Installation

You can install the development version of onchainR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
# devtools::install_github("brandonleekramer/onchainR")
```

## JSON-RPC

- **JSON-RPC:** JSON-RPC APIs are the easiest way to read data off of a
  blockchain. These APIs get basic account, balance, and network data.
  You can learn more about [blockchain JSON-RPC nodes
  here](https://www.alchemy.com/overviews/rpc-node).<br>
- **Example:** In this example, we check how much `vitalik.eth` has in
  their wallet using the `eth_getBalance` function.<br>
- **Process:** To do this, you will need to pick a JSON-RPC provider.
  `onchainR` currently supports [Infura](https://www.infura.io/),
  [Grove](https://grove.city/), [DRPC](https://drpc.org/),
  [Quicknode](https://www.quicknode.com/), and
  [Alchemy](https://www.alchemy.com/), but these functions likely work
  with dozens of other JSON-RPC providers too. We’ve tried to design
  these functions to minimize vendor lock-in. Once you have picked a
  provider, you’ll need to copy an endpoint and API key from within your
  account.<br>

``` r
library("tidyverse") 
library("onchainR") 

vitalik_eth = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
my_rpc_provider = "https://mainnet.infura.io/v3/"
my_api_key = infura_api_key

eth_getBalance(wallet_address = vitalik_eth, 
               provider_url = my_rpc_provider, 
               api_key = my_api_key, 
               return_format = "ETH")
#> [1] 955.6283
```

## Blockchain Explorer

- **Blockchain Explorer:** Blockchain Explorer APIs are ideal for
  getting balances and historical transaction data for specific wallets.
  [Etherscan](https://etherscan.io/aboutus) is the industry leader for
  blockhain explorers and `onchainR`’s starting point for this API. We
  plan to add support for other providers in the coming months.<br>
- **Example:** Below, we provide an example on how to use `onchainR` to
  get ETH balances across two wallets on four different chains:
  Ethereum, Arbitrum One, Polygon, and Base.<br>
- **Process:** To carry out this code snippet for your purposes, you
  will need to visit [Etherscan](https://etherscan.io/),
  [Arbiscan](https://arbiscan.io/),
  [Polygonscan](https://polygonscan.com/), and
  [Basescan](https://basescan.org/) to acquire API keys and then use
  those keys in the following code snippet.<br>

``` r
my_wallet_list = c("0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045",
                   "0x50EC05ADe8280758E2077fcBC08D878D4aef79C3")

ether_balances = bind_rows(
  explorerBalances(my_wallet_list, 
                   blockchain_explorer = "etherscan", 
                   etherscan_api_key) %>% mutate(chain = "Ethereum"),
  explorerBalances(my_wallet_list, 
                   blockchain_explorer = "arbiscan", 
                   arbiscan_api_key) %>% mutate(chain = "Arbitrum"),
  explorerBalances(my_wallet_list, 
                   blockchain_explorer = "polygonscan", 
                   polygonscan_api_key) %>% mutate(chain = "Polygon"),
  explorerBalances(my_wallet_list, 
                   blockchain_explorer = "basescan", 
                   basescan_api_key) %>% mutate(chain = "Base")
)

ether_balances
#>                                      account      balance currency    chain
#> 1 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045 955.62834491      ETH Ethereum
#> 2 0x50EC05ADe8280758E2077fcBC08D878D4aef79C3   1.32350685      ETH Ethereum
#> 3 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045   1.19636885      ETH Arbitrum
#> 4 0x50EC05ADe8280758E2077fcBC08D878D4aef79C3   1.00531341      ETH Arbitrum
#> 5 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045 447.16134434      ETH  Polygon
#> 6 0x50EC05ADe8280758E2077fcBC08D878D4aef79C3 879.70136309      ETH  Polygon
#> 7 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045   0.03519259      ETH     Base
#> 8 0x50EC05ADe8280758E2077fcBC08D878D4aef79C3   0.01321418      ETH     Base
```

## Subgraphs

- **Subgraphs:** Subgraphs allow users to query data on smart contracts
  using GraphQL. For example, to query all transactions within a single
  Uniswap v3 liquidity pool over the last 24 hours, Uniswap simply needs
  to define their schema, index the event data to create the subgraph,
  and then use the generated GraphQL API to query their subgraph for
  flexible and efficient blockchain data. With [The
  Graph](https://thegraph.com/), subgraphs can also be published onchain
  so *anyone* can use them! Several other blockchain data providers,
  including Alchemy and Goldsky, allow you to create your own subgraphs.
  We opted to develop wrapper functions for The Graph specifically
  because that protocol provides the largest open repository of existing
  subgraphs to query onchain projects.<br>
- **Example:** In this example, we use the [Uniswap V3
  subgraph](https://thegraph.com/explorer/subgraphs/5zvR82QoaXYFyDEKLZ9t6v9adgnptxYpKpSbxtgVENFV?v=0&view=Playground&chain=arbitrum-one)
  on The Graph Network. To search for subgraphs that index other smart
  contracts, use [Graph Explorer](https://thegraph.com/explorer). The
  Graph also has a [free hosted
  service](https://thegraph.com/hosted-service), but it is set to retire
  in Q2 2024.<br>
- **Process:** We develop a GraphQL query under the `Playground` tab,
  copy the `Subgraph ID` from the top of the page, and copy both into
  our R code. Next, we go to [Subgraph
  Studio](https://thegraph.com/studio/apikeys/) to get an API key. Note
  that this subgraph is deployed on The Graph on Arbitrum, which you
  check by validating the Network Switcher in the top-right corner of
  the page.<br>

``` r
uniswap_query = "{ bundles(first: 5) { id ethPriceUSD } }"
uniswapv3_subgraph = "5zvR82QoaXYFyDEKLZ9t6v9adgnptxYpKpSbxtgVENFV"
my_api_key = graph_api_key

query_subgraph(graphql_query = uniswap_query,
               subgraph_id = uniswapv3_subgraph,
               api_key = my_api_key)
#> $bundles
#>                          ethPriceUSD id
#> 1 3585.36345061335950426213087235299  1
```

- **Example:** In a second example, we use the [Chainlink Prices
  subgraph](https://thegraph.com/explorer/subgraphs/4RTrnxLZ4H8EBdpAQTcVc7LQY9kk85WNLyVzg5iXFQCH?view=Playground&chain=arbitrum-one).
  As the name suggests, this subgraph grabs prices from the Chainlink
  price oracle, so you can plug in an asset to find its price relative
  to USD. For more custom<br>

``` r
current_prices = bind_rows(
  c(token = "BTC", current_price = getCryptoPrice("BTC", graph_api_key)),
  c(token = "ETH", current_price = getCryptoPrice("ETH", graph_api_key)),
  c(token = "SOL", current_price = getCryptoPrice("SOL", graph_api_key))
)
current_prices
#> # A tibble: 3 × 2
#>   token current_price
#>   <chr> <chr>        
#> 1 BTC   67354.89     
#> 2 ETH   3588.8765803 
#> 3 SOL   197.4402
```

## Functions, Chains, and Providers

Below provides a list of functions that draw on the blockchain methods
for select chains and providers.

<img src="man/figures/onchainR-01.png" align="center" width=100% />
<img src="man/figures/onchainR-02.png" align="center" width=100% />
<img src="man/figures/onchainR-03.png" align="center" width=100% />
<img src="man/figures/onchainR-04.png" align="center" width=100% />

## Additional Packages

For those interested in other blockchain data APIs in R, please see
other projects below:

[`coinmarketcapr`](https://github.com/amrrs/coinmarketcapr) was designed
to help R developers and data scientists to extract and monitor price
and market cap of various cryptocurrencies from CoinMarketCap by getting
their price, 24h trade volume, market cap and much more in USD and other
currencies.

[`etherscanr`](https://github.com/dirkschumacher/etherscanr/) is an open
archive package that offers an easy way to use the etherscan.io API to
query information about the Ethereum network.
