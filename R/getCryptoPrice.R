#' Returns an array of addresses owned by the client. Note that most providers 
#' do not store private keys, so this will often return an empty response.
#'
#' @param token The token that you want the price of relative to USD.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns an array of addresses owned by the client.
#' @export
#'
#' @examples
#' my_api_key = "3a2f2d6ce1672801c3a044139373a287"
#'
#' getCryptoPrice("GRT", my_api_key)
#'
getCryptoPrice = function(token, api_key){
  chainlink_query = stringr::str_c('{ assetPairs(where: {id: "',
                                   token,'/USD" }) { id currentPrice }}')
  token_price = query_subgraph(graphql_query = chainlink_query,
                               subgraph_id = "4RTrnxLZ4H8EBdpAQTcVc7LQY9kk85WNLyVzg5iXFQCH",
                               api_key = api_key)
  token_price = as.numeric(token_price$assetPairs$currentPrice)
  token_price
}
