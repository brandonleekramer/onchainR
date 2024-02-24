
library("tidyverse")
library("coinmarketcapr")

coinmarketcapr::setup("c0ded540-cbfc-496d-971d-6d99ff2a8de0")

crypto_symbols = c("ATOM", "KUJI", "OSMO", "TIA", "INJ", "AKT")
  
current_prices = get_crypto_quotes(currency = "USD",
                                   symbol = crypto_symbols,
                                   use.names=FALSE)
first_step = map_df(current_prices$quote, ~as.data.frame(t(.)))
second_step = round(as.data.frame(unlist(first_step[1])), 7)
third_step = round(as.data.frame(unlist(first_step[10])), 2)
second_step$usd_price = second_step$`unlist(first_step[1])`
third_step$market_cap = third_step$`unlist(first_step[10])`
current_prices = data.frame(symbol = (current_prices$symbol),
                            usd_price = second_step$usd_price,
                            market_cap = third_step$market_cap) 
rm(first_step, second_step, third_step)

AKT = current_prices$usd_price[1]
ATOM = current_prices$usd_price[2]*20
INJ = current_prices$usd_price[3]*10
KUJI = current_prices$usd_price[4]*50
OSMO = current_prices$usd_price[5]*100
TIA = current_prices$usd_price[6]*30
sum(ATOM, INJ, KUJI, OSMO, TIA)
AKT = (2000-sum(ATOM, INJ, KUJI, OSMO, TIA))/current_prices$usd_price[1]; AKT



