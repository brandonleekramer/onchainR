#' Converts hexidecimal value to wei value
#'
#' @param hex_value A hexidecimal value 
#'
#' @return A value corresponding to a wei value.
#' @export
#'
#' @examples
#' vitalik_eth = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#' 
#' balance_as_hex = eth_get_balance(vitalik_eth, my_provider_url, my_api_key, "hexidecimal")
#' 
#' balance_as_wei = hex_to_wei(balance_as_hex)
#' balance_as_wei
#'
hex_to_wei = function(hex_value){
  wei_value = as.numeric(hex_value)
  wei_value
}