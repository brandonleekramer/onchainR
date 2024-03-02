#' Returns subgraph data from an indexed smart contract on The Graph's hosted service
#'
#' @param graphql_query A GraphQL query of a subgraph.
#' @param subgraph_url The URL of a hosted service subgraph from The Graph. 
#'
#' @return Returns subgraph data from an indexed smart contract.
#' @export
#'
#' @examples
#' uniswap_query = "{factories(first: 5){ id poolCount txCount totalVolumeUSD }}"
#' uniswap_v3_hosted = "https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v3"
#' 
#' query_hosted_subgraph(uniswap_query, uniswap_v3_hosted)
#' 
query_hosted_subgraph = function(graphql_query, subgraph_url){
  
  graphql_conn <- ghql::GraphqlClient$new(url = subgraph_url)
  qry <- ghql::Query$new()
  qry$query('query_table', graphql_query)
  query_table <- graphql_conn$exec(qry$queries$query_table)
  query_table <- jsonlite::fromJSON(query_table)
  query_table <- query_table$data
  query_table
}