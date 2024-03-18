#' Get the balance of multiple addresses in ETH
#'
#' @param wallet_addresses An Ethereum wallet balance (ENS domains not supported).
#' @param blockchain_explorer A blockchain explorer API provider: "etherscan", "arbiscan".
#' @param api_key The API key of the Blockchain Explorer such as Etherscan or Arbiscan.
#'
#' @return Returns a dataframe with columns of account addresses, account balances, and currencies.
#' @export
#'
#' @examples
#' blockchain_wallets = c("0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045",
#'                        "0x50EC05ADe8280758E2077fcBC08D878D4aef79C3")
#'
#' explorerBalances(wallet_addresses = blockchain_wallets,
#'                  blockchain_explorer = "etherscan",     
#'                  api_key = "A79S4QJXS518CS6ZQYFHB5SX5AWE7E952D")
#'
explorerBalances = function(wallet_addresses, 
                            blockchain_explorer, 
                            api_key){
  
  explorer_url = getExplorerURL(blockchain_explorer)
  wallet_addresses = paste0(wallet_addresses, collapse = ",")
  url = stringr::str_c("https://",explorer_url,"/api",
                       "?module=account",
                       "&action=balancemulti",
                       "&address=",wallet_addresses,
                       "&tag=latest",
                       "&apikey=",api_key)
  url_result <- jsonlite::fromJSON(url)
  url_result = url_result$result 
  url_result = as.data.frame(url_result)
  url_result$balance = as.numeric(url_result$balance)/(10^18)
  url_result$currency = "ETH"
  url_result
}

# TODO: Add Avalanche, zkSync, Fantom, Gnosis, and others