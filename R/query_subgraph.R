#' Returns subgraph data from an indexed smart contract on The Graph Network. Use `query_hosted_subgraph()` to query The Graph's hosted service.
#'
#' @param graphql_query A GraphQL query of a subgraph.
#' @param subgraph_id Subgraph ID (found near top of subgraph page on Graph Explorer)
#' @param api_key An API key from Subgraph Studio.
#' @param deployment_network Network that subgraph was deployed/published on: "arbitrum" or "ethereum"
#'
#' @return Returns subgraph data from an indexed smart contract.
#' @export
#'
#' @examples
#' uniswap_query = "{factories(first: 5){ id poolCount txCount totalVolumeUSD }}"
#' 
#' query_subgraph(uniswap_query, 
#'                subgraph_id = "5zvR82QoaXYFyDEKLZ9t6v9adgnptxYpKpSbxtgVENFV", 
#'                api_key = "3a2f2d6ce1672801c3a044139373a287", 
#'                deployment_network = "arbitrum")
#' 
query_subgraph = function(graphql_query, 
                          subgraph_id, 
                          api_key, 
                          deployment_network){
  
  if (deployment_network == "ethereum") {                       
  graphql_conn <- ghql::GraphqlClient$new(
    url = stringr::str_c("https://gateway.network.thegraph.com/api/subgraphs/id/", subgraph_id), 
    headers = list(Authorization = paste0("Bearer ", api_key)))
  } 
  if (deployment_network == "arbitrum") {
    graphql_conn <- ghql::GraphqlClient$new(
      url = stringr::str_c("https://gateway-arbitrum.network.thegraph.com/api/subgraphs/id/", subgraph_id), 
      headers = list(Authorization = paste0("Bearer ", api_key)))
  } else {
    print("Please specify deployment_network as 'arbitrum' or 'ethereum'.")
  }
  
  qry <- ghql::Query$new()
  qry$query('query_table', graphql_query)
  query_table <- graphql_conn$exec(qry$queries$query_table)
  query_table <- jsonlite::fromJSON(query_table)
  query_table <- query_table$data
  query_table
}


