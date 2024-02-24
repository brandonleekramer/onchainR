

query_subgraph = function(api_or_query_key, subgraph_id, graphql_query){
  
  library("ghql")
  library("jsonlite")
  
  graphql_conn <- ghql::GraphqlClient$new(
    url = str_c("https://gateway.thegraph.com/api/subgraphs/id/", subgraph_id), 
    headers = list(Authorization = paste0("Bearer ", api_or_query_key)))
  
  qry <- Query$new()
  qry$query('query_table', graphql_query)
  query_table <- graphql_conn$exec(qry$queries$query_table)
  query_table <- jsonlite::fromJSON(query_table)
  query_table <- query_table$data
  query_table
}