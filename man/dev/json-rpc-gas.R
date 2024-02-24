
eth_get_balance = function(wallet, provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0",
                 "params": ["',wallet,'", "latest"], 
                 "method": "eth_getBalance"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)/(10^18)
  request_output
}

eth_get_code = function(wallet, provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0",
                "params": ["',wallet,'", "latest"], "method": "eth_getCode"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output$result
}

eth_block_number = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0",
                 "method": "eth_blockNumber"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}

eth_chain_id = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0",
                 "method": "eth_chainId"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)
  request_output
}

eth_gas_price = function(provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>% 
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0",
                 "method": "eth_gasPrice"}')) %>% 
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)/(10^9)
  request_output
}





