
library("ghql")
library("jsonlite")

query_subgraph = function(api_or_query_key, subgraph_id, graphql_query){
  
  graphql_conn <- ghql::GraphqlClient$new(
    url = paste0("https://gateway.thegraph.com/api/subgraphs/id/", subgraph_id), 
    headers = list(Authorization = paste0("Bearer ", api_or_query_key)))
  
  qry <- Query$new()
  qry$query('query_table', my_graphql_query)
  query_table <- graphql_conn$exec(qry$queries$query_table)
  query_table <- jsonlite::fromJSON(query_table)
  query_table <- query_table$data$indexers
  query_table
}

my_api_or_query_key = "paste_your_key_here"
my_subgraph_id = "8yHBZUvXcKkZnZM7SDSgcRMtbtNwgUQfM37cA37h7cet"
my_graphql_query = "{
  indexers(first: 5) {
    id
    geoHash
    indexerIndexingRewards
  }
}"

subgraph_output = query_subgraph(my_api_or_query_key, my_subgraph_id, my_graphql_query)
subgraph_output
 

