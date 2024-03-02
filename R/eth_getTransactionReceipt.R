#' Returns the receipt of a transaction by transaction hash.
#'
#' @param block_hash A transaction hash
#' @param provider_url The URL of a JSON-RPC provider such as Grove, DRPC, Quicknode, Infura, Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns the receipt of a transaction by transaction hash.
#' @export
#'
#' @examples
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#' my_block_hash = "0x85d995eba9763907fdf35cd2034144dd9d53ce32cbec21349d4b12823c6860c5"
#'
#' eth_getTransactionReceipt(my_block_hash, my_provider_url, my_api_key)
#'
eth_getTransactionReceipt = function(block_hash, provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>% 
    httr2::req_headers('accept' = "application/json", 
                       'content-type' = "application/json") %>%
    httr2::req_body_raw(
      stringr::str_c('{"method":"eth_getTransactionReceipt",
                     "params":["',block_hash,'"],"id":1,"jsonrpc":"2.0"}')) %>% 
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output
}