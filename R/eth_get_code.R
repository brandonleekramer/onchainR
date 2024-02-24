#' Fill in later
#'
#' @param wallet_address An Ethereum wallet balance (ENS domains not supported).
#' @param provider_url The URL of a JSON-RPC provider such as Pocket Network, Infura, or Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return A numeric value of an Ethereum balance.
#' @export
#'
#' @examples
#' vitalik_eth = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
#' my_provider_url = "https://eth-mainnet.rpc.grove.city/v1/"
#' my_api_key = "fadc98f89"
#'
#' eth_get_code(vitalik_eth, my_provider_url, my_api_key)
#'
eth_get_code = function(wallet_address, provider_url, api_key){
  request_output = httr2::request(stringr::str_c(provider_url, api_key)) %>%
    httr2::req_headers('accept' = "application/json",
                       'content-type' = "application/json") %>%
    httr2::req_body_raw(stringr::str_c('{"id": 1,
                        "jsonrpc": "2.0", "method": "eth_getCode",
                        "params": ["',wallet_address,'", "latest"]}')) %>%
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output$result
}
