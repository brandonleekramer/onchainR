#' Returns the compiled byte code of a smart contract, if any, at a given address.
#'
#' @param wallet_address An Ethereum wallet balance (ENS domains not supported).
#' @param provider_url The URL of a JSON-RPC provider such as Pocket Network, Infura, or Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns the compiled byte code of a smart contract, if any, at a given address.
#' @export
#'
#' @examples
#' vitalik_eth = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#'
#' eth_getCode(vitalik_eth, my_provider_url, my_api_key)
#'
eth_getCode = function(wallet_address, provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>%
    httr2::req_headers('accept' = "application/json",
                       'content-type' = "application/json") %>%
    httr2::req_body_raw(stringr::str_c('{"id": 1,
                        "jsonrpc": "2.0", "method": "eth_getCode",
                        "params": ["',wallet_address,'","latest"]}')) %>%
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output$result
}
