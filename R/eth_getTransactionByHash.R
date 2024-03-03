#' Returns the information about a transaction from a transaction hash.
#'
#' @param transaction_hash A transaction hash
#' @param provider_url The URL of a JSON-RPC provider such as Grove, DRPC, Quicknode, Infura, Alchemy.
#' @param api_key The API key of the JSON-RPC provider.
#'
#' @return Returns the information about a transaction from a transaction hash.
#' @export
#'
#' @examples
#' my_provider_url = "https://mainnet.infura.io/v3/"
#' my_api_key = "04f25f82de3840e1afd524b62d6767c5"
#' my_transaction_hash = "0xb1fac2cb5074a4eda8296faebe3b5a3c10b48947dd9a738b2fdf859be0e1fbaf"
#'
#' eth_getTransactionByHash(my_transaction_hash, my_provider_url, my_api_key)
#'
eth_getTransactionByHash = function(transaction_hash, provider_url, api_key){
  request_output = httr2::request(
    stringr::str_c(provider_url, api_key)) %>% 
    httr2::req_headers('accept' = "application/json", 
                       'content-type' = "application/json") %>%
    httr2::req_body_raw(
      stringr::str_c('{"method":"eth_getTransactionByHash", 
                     "id":1,"jsonrpc":"2.0", "params":["',transaction_hash,'"]}')) %>% 
    httr2::req_perform() %>%
    httr2::resp_body_json()
  
  request_output_df = data.frame(
    transaction_hash = transaction_hash,
    block_number = as.numeric(request_output$result$blockNumber),
    block_hash = request_output$result$blockHash,
    hash = request_output$result$hash, 
    from = request_output$result$from,
    to = request_output$result$to,
    value = as.numeric(request_output$result$value)/(10^18),
    gas_price = as.numeric(request_output$result$gasPrice)/(10^9),
    gas_limit = as.numeric(request_output$result$gas),
    input = request_output$result$input,
    nonce = as.numeric(request_output$result$nonce),
    transaction_index = as.numeric(request_output$result$transactionIndex),
    type = request_output$result$type,
    r = request_output$result$r,
    s = request_output$result$s,
    v = request_output$result$v
  ); request_output_df
}