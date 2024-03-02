#' Returns information about a transaction given a blockhash and transaction index position.
#'
#' @param block_hash A block hash.
#' @param index An integer of the transaction index position encoded as a hexadecimal.
#' @param provider_url The URL of a JSON-RPC provider such as Pocket Network, Infura, or Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns information about a transaction given a blockhash and transaction index position.
#' @export
#'
#' @examples
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#' my_block_hash = "0x829df9bb801fc0494abf2f443423a49ffa32964554db71b098d332d87b70a48b"
#' my_index = "0x0" 
#'
#' eth_getTransactionByBlockHashAndIndex(my_block_hash, my_index, 
#'                                       my_provider_url, my_api_key)
#'
eth_getTransactionByBlockHashAndIndex = function(block_hash, index, 
                                                 provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>% 
    httr2::req_headers('accept' = "application/json", 
                       'content-type' = "application/json") %>%
    httr2::req_body_raw(
      stringr::str_c('{"method":"eth_getTransactionByBlockHashAndIndex",
                     "params":["',block_hash,'","',index,'"],"id":1,"jsonrpc":"2.0"}')) %>% 
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output 
}
