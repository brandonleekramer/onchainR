#' Returns the latest block number of the blockchain.
#'
#' @param provider_url The URL of a JSON-RPC provider such as Pocket Network, Infura, or Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return A numeric value of an Ethereum balance.
#' @export
#'
#' @examples
#' my_provider_url = "https://eth-mainnet.rpc.grove.city/v1/"
#' my_api_key = "fadc98f89"
#'
#' eth_block_number(my_provider_url, my_api_key)
#'
eth_block_number = function(provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>% 
    httr2::req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    httr2::req_body_raw(
    stringr::str_c('{"id": 1,"jsonrpc": "2.0", 
                   "method": "eth_blockNumber"}')) %>% 
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}
