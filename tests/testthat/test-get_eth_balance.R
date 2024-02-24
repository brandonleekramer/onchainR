test_that("eth_get_balance() returns Ethereum balance", {
  vitalik_eth = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
  grove_url = "https://eth-mainnet.rpc.grove.city/v1/"
  grove_api_key = "api-key"
  eth_get_balance(vitalik_eth, grove_url, grove_api_key)
})
