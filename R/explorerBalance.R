#' Get the balance of the specified address in ETH
#'
#' @param wallet_address An Ethereum wallet balance (ENS domains not supported).
#' @param blockchain_explorer A blockchain explorer API provider. Supported 
#' @param api_key The API key of the Blockchain Explorer such as Etherscan or Arbiscan.
#'
#' @return Returns a dataframe with columns of account address, account balance, and currency.
#' @export
#'
#' @examples
#'
#' explorerBalance(wallet_address = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045",
#'                 blockchain_explorer = "ethereum",     
#'                 api_key = "A79S4QJXS518CS6ZQYFHB5SX5AWE7E952D")
#'
explorerBalance = function(wallet_address, 
                           blockchain_explorer, 
                           api_key){
  
  #if (blockchain_explorer == "avalanche"){ explorer_url = "api.avascan.info" }
  if (blockchain_explorer == "ethereum"){ explorer_url = "api.etherscan.io" } 
  if (blockchain_explorer == "base"){ explorer_url = "api.basescan.org" }
  if (blockchain_explorer == "optimism"){ explorer_url = "api-optimistic.etherscan.io" } 
  if (blockchain_explorer == "polygon"){ explorer_url = "api.polygonscan.com" } 
  if (blockchain_explorer == "scroll"){ explorer_url = "api.scrollscan.com" } 
  #else if (print("This blockchain explorer is not yet supported by onchainR."))
  
  url = stringr::str_c("https://",explorer_url,"/api",
                       "?module=account",
                       "&action=balance",
                       "&address=",wallet_address,
                       "&tag=latest",
                       "&apikey=",api_key)
  url_result <- jsonlite::fromJSON(url)
  url_result = url_result$result 
  url_result = data.frame(
    account = wallet_address,
    balance = as.numeric(url_result)/(10^18),
    currency = "ETH"
  )
  url_result
}

# TODO: Add Avalanche, zkSync, Fantom, Gnosis, and others