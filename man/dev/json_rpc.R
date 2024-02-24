
eth_get_balance = function(wallet, provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "eth_getBalance",
                 "params": ["',wallet,'", "latest"]}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)/(10^18)
  request_output
}

eth_get_code = function(wallet, provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "eth_getCode",
                "params": ["',wallet,'", "latest"]}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output$result
}

eth_get_storage_at = function(wallet, provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1, "jsonrpc": "2.0", "method": "eth_getStorageAt",
                 "params": ["',wallet,'","0x0","latest"]}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output$result
}

eth_accounts = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "eth_accounts"}')) %>% 
    req_perform() %>%
    resp_body_json()
  if (length(request_output$result) <= 2){
    print("This request provided no data. Your provider does not store any keys.")
  } else {
    request_output
  }
}

eth_block_number = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "eth_blockNumber"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}

eth_chain_id = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "eth_chainId"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}

net_listening = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "net_listening"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}

net_version = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "net_version"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}

eth_protocol_version = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "eth_protocolVersion"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}

web3_client_version = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "web3_clientVersion"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output$result
}

web3_sha3 = function(sha3, provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "web3_sha3",
                       "params": ["',sha3,'"]}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output$result
}

eth_gas_price = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "eth_gasPrice"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)/(10^9)
  request_output
}

eth_estimate_gas = function(from, to, provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{
                        "id": 1,
                        "jsonrpc": "2.0",
                        "method": "eth_estimateGas",
                        "params": [
                          {
                            "from": "',from,'",
                            "to": "',to,'"
                          }
                        ]}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}

# transcation data 

eth_get_transaction_count = function(wallet, provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1, "jsonrpc": "2.0", "method": "eth_getTransactionCount",
                 "params": ["',wallet,'","latest"]}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}

eth_get_transaction_by_hash = function(transaction_hash, provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1, "jsonrpc": "2.0", 
                        "method": "eth_getTransactionByHash",
                        "params": ["',transaction_hash,'"]}')) %>% 
    req_perform() %>%
    resp_body_json()

  # there are more outputs in the infura data
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

eth_get_block_by_hash = function(block_hash, provider_url, api_key){
  request_output = request(str_c(alchemy_url, alchemy_api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1, "jsonrpc": "2.0", "method": "eth_getBlockByHash",
                         "params": ["',block_hash,'", false]}')) %>% 
    req_perform() %>%
    resp_body_json()
  
  # there are more outputs in the infura data
  
}
