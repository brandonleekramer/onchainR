#' Get the balance of the specified address in eth, wei, or hexidecimal format
#'
#' @param wallet_address An Ethereum wallet balance (ENS domains not supported).
#' @param provider_url The URL of a JSON-RPC provider such as Pocket Network, Infura, or Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#' @param return_format Returns the balance of wallet in "eth", "wei", or "hexidecimal" format
#'
#' @return A numeric value of an Ethereum balance.
#' @export
#'
#' @examples
#' vitalik_eth = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#' return_format = "ETH"
#'
#' eth_getBalance(vitalik_eth, my_provider_url, my_api_key, return_format)
#'
eth_getBalance = function(wallet_address, provider_url, api_key, return_format){
  
  request_output = httr2::request(stringr::str_c(provider_url, api_key)) %>%
    httr2::req_headers('accept' = "application/json",
                       'content-type' = "application/json") %>%
    httr2::req_body_raw(
      stringr::str_c('{"id": 1,"jsonrpc": "2.0", "method": "eth_getBalance",
                      "params": ["',wallet_address,'", "latest"]}')) %>%
    httr2::req_perform() %>%
    httr2::resp_body_json()
  
  if (missing(return_format)) {
    request_output = hex_to_eth(request_output$result)
    request_output
  } else if (return_format == "ETH" | return_format == "eth") {
    request_output = hex_to_eth(request_output$result)
    request_output
  } else if (return_format == "WEI" | return_format == "wei") { 
    request_output = hex_to_wei(request_output$result)
    request_output
  } else if (return_format == "hexidecimal") {
    request_output$result
  } else {
    print("Return format not supported. Please specify 'eth', 'wei', or 'hexidecimal'.")
  }
}
