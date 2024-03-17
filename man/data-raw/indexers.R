
source("~/Documents/git/secrets.R")
notion_secret = enpopps_secret
notion_database = "894b79b99d2f4b01967a87ca08c5a7e5"

# download notion organization data 
notion_orgs = getNotionDatabase(
  notion_secret, notion_database) %>% 
  janitor::clean_names()

# prep indexer data 
notion_indexers = notion_orgs %>% 
  mutate(notion_id = str_replace_all(id, "-", "")) %>% 
  rename(Company = properties_company_name_title_plain_text,
         Chains = properties_chains_multi_select_name,
         `Company domain name` = properties_company_domain_name_url,
         `Wallet address` = properties_wallet_address_rich_text_plain_text,
         `Upload status` = properties_hubspot_multi_select_name, 
         `Use case` = properties_use_case_multi_select_name,
         `Queries served 30D` = properties_queries_served_30d_number,
         `Fees earned 30D` = properties_fees_earned_30d_number) %>%
  select(notion_id, Company, `Company domain name`, Chains, `Wallet address`,
         `Use case`,`Queries served 30D`, `Fees earned 30D`, `Upload status`) %>% 
  filter(!is.na(`Company domain name`) & grepl("Indexer", `Use case`))  %>%
  mutate(`Company domain name` = str_replace_all(`Company domain name`, "//www\\.", "//"))

indexers = notion_indexers %>% 
  select(Company, `Wallet address`) %>% 
  separate_rows(`Wallet address`) %>% 
  rename(indexer_name = Company, 
         wallet_address = `Wallet address`) %>% 
  filter(!is.na(wallet_address)) %>% 
  arrange(indexer_name)

setwd("~/Documents/git/onchainR/data")
save(indexers, file = "indexers.rda")

setwd("~/Documents/git/braindexer/data")
write_csv(indexers, "indexers.csv")




