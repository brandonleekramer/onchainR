#' Returns a link to a blockchain explorer
#'
#' @param blockchain_explorer A blockchain explorer API provider: "etherscan", "arbiscan".
#'
#' @return Returns a link to a blockchain explorer - typically used in explorerBalances(). 
#' @export
#'
#' @examples
#'
#' getExplorerURL("etherscan")
#'
getExplorerURL = function(blockchain_explorer){
  
  if (blockchain_explorer == "etherscan"){ explorer_url = "api.etherscan.io" } 
  if (blockchain_explorer == "arbiscan"){ explorer_url = "api.arbiscan.io" }
  if (blockchain_explorer == "basescan"){ explorer_url = "api.basescan.org" }
  if (blockchain_explorer == "optimismscan"){ explorer_url = "api-optimistic.etherscan.io" } 
  if (blockchain_explorer == "polygonscan"){ explorer_url = "api.polygonscan.com" } 
  if (blockchain_explorer == "scrollscan"){ explorer_url = "api.scrollscan.com" }
  # if (blockchain_explorer == "avascan"){ explorer_url = "api.avascan.info" }
  # if (blockchain_explorer == "mantascan"){ explorer_url = "api.scrollscan.com" }
  # if (blockchain_explorer == "mantlescan"){ explorer_url = "api.scrollscan.com" }
  
  explorer_url
}