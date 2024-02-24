#' Returns the currently configured chain id
#'
#' @param provider_url The URL of a JSON-RPC provider such as Pocket Network, Infura, or Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns the currently configured chain id
#' @export
#'
#' @examples
#' my_provider_url = "https://eth-mainnet.rpc.grove.city/v1/"
#' my_api_key = "fadc98f89"
#'
#' eth_chain_id(my_provider_url, my_api_key)
#'
eth_chain_id = function(provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>% 
    httr2::req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    httr2::req_body_raw(stringr::str_c('{"id": 1,"jsonrpc": "2.0", 
                                       "method": "eth_chainId"}')) %>% 
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}
