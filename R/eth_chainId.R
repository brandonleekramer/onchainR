#' Returns the currently configured chain id
#'
#' @param provider_url The URL of a JSON-RPC provider such as Pocket Network, Infura, or Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns the currently configured chain id
#' @export
#'
#' @examples
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#'
#' eth_chainId(my_provider_url, my_api_key)
#'
eth_chainId = function(provider_url, api_key){
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
