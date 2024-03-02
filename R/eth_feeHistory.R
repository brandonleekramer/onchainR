#' Returns the collection of historical gas information.
#'
#' @param block_count The number of blocks in the requested range. Between 1 and 1024 blocks can be requested in a single query. It will return less than the requested range if not all blocks are available.
#' @param newest_block The highest number block of the requested range in hexadecimal format or tags. The supported tag values include earliest for the earliest/genesis block, latest for the latest mined block, pending for the pending state/transactions, safe for the most recent secure block, and finalized for the most recent secure block accepted by more than 2/3 of validators.
#' @param reward_min The minimum percentile value that surrounds the range of percentile rewards
#' @param reward_max The maximum percentile value that surrounds the range of percentile rewards
#' @param provider_url The URL of a JSON-RPC provider such as Grove, DRPC, Quicknode, Infura, Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns the collection of historical gas information: oldestBlock, baseFeePerGas, gasUsedRatio and reward.
#' @export
#'
#' @examples
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#'
#' eth_feeHistory(block_count = 4, newest_block = "latest",
#'                reward_min = 25, reward_max = 75,
#'                my_provider_url, my_api_key)
#'
eth_feeHistory = function(block_count, newest_block, 
                          reward_min, reward_max, 
                          provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>% 
    httr2::req_headers('accept' = "application/json", 
                       'content-type' = "application/json") %>%
    httr2::req_body_raw(
      stringr::str_c('{"method":"eth_feeHistory", "params":[',block_count,', 
                     "latest", [',reward_min,', ',reward_max,']],"id":1,"jsonrpc":"2.0"}')) %>% 
    httr2::req_perform() %>%
    httr2::resp_body_json()
  request_output
}



