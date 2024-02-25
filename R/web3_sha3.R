#' Returns Keccak-256 (not the standardized SHA3-256) hash of the given data
#'
#' @param sha3 The data in hexadecimal form to convert into a SHA3 hash
#' @param provider_url The URL of a JSON-RPC provider such as Pocket Network, Infura, or Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return The SHA3 hash of the given string
#' @export
#'
#' @examples
#' my_sha3 = "0x68656c6c6f20776f726c64"
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#'
#' web3_sha3(my_sha3, my_provider_url, my_api_key)
#'
web3_sha3 = function(sha3, provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>% 
    httr2::req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    httr2::req_body_raw(
    stringr::str_c('{"id": 1,"jsonrpc": "2.0", 
                   "method": "web3_sha3","params": ["',sha3,'"]}')) %>% 
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output$result
}
