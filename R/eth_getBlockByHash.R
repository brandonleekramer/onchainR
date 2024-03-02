#' Returns information of the block matching the given block hash.
#'
#' @param block_hash The hash (32 bytes) of the block
#' @param provider_url The URL of a JSON-RPC provider such as Grove, DRPC, Quicknode, Infura, Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns information of the block matching the given block hash.
#' @export
#'
#' @examples
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#' my_block_hash = "0x3f07a9c83155594c000642e7d60e8a8a00038d03e9849171a05ed0e2d47acbb3"
#'
#' eth_getBlockByHash(my_block_hash, my_provider_url, my_api_key)
#'
eth_getBlockByHash = function(block_hash, provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>% 
    httr2::req_headers('accept' = "application/json", 
                       'content-type' = "application/json") %>%
    httr2::req_body_raw(
      stringr::str_c('{"method":"eth_getBlockByHash",
                     "params":["',block_hash,'",false],"id":1,"jsonrpc":"2.0"}')) %>% 
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output
}