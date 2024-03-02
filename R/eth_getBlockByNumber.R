#' Returns information of the block matching the given block number.
#'
#' @param block_number The block number in hexadecimal format or the string "earliest", "latest", "pending", "safe", or "finalized".
#' @param provider_url The URL of a JSON-RPC provider such as Grove, DRPC, Quicknode, Infura, Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns information of the block matching the given block number.
#' @export
#'
#' @examples
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#'
#' eth_getBlockByNumber("0xc5043f", my_provider_url, my_api_key)
#'
eth_getBlockByNumber = function(block_number, provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>% 
    httr2::req_headers('accept' = "application/json", 
                       'content-type' = "application/json") %>%
    httr2::req_body_raw(
      stringr::str_c('{"method":"eth_getBlockByNumber",
                     "params":["',block_number,'",false],"id":1,"jsonrpc":"2.0"}')) %>% 
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output
}