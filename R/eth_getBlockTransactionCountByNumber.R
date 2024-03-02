#' Returns the number of transactions for the block matching the given block number.
#'
#' @param block_number A block number as a string in hexadecimal format or tags.
#' @param provider_url The URL of a JSON-RPC provider such as Pocket Network, Infura, or Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns the number of transactions for the block matching the given block number.
#' @export
#'
#' @examples
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#' my_block_number = "0xc5043f"
#'
#' eth_getBlockTransactionCountByNumber(my_block_number, my_provider_url, my_api_key)
#'
eth_getBlockTransactionCountByNumber = function(block_number, provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>% 
    httr2::req_headers('accept' = "application/json", 
                       'content-type' = "application/json") %>%
    httr2::req_body_raw(
      stringr::str_c('{"method":"eth_getBlockTransactionCountByNumber",
                     "params":["',block_number,'"],"id":1,"jsonrpc":"2.0"}')) %>% 
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output 
}
