/// Example functions for calling the Github GraphQL API
///
/// ### Queries
/// * [readRepositories()]
///
/// ### Mutations:
/// * [starRepository(id)]
/// * [removeStarFromRepository(id)]
///
/// To run the example, create a file `lib/local.dart` with the content:
/// ```dart
/// const String YOUR_PERSONAL_ACCESS_TOKEN =
///    '<YOUR_PERSONAL_ACCESS_TOKEN>';
/// ```
import 'dart:io' show stdout, stderr, exit;
import 'package:graphql/client.dart';

// to run the example, replace <YOUR_PERSONAL_ACCESS_TOKEN> with your GitHub token in ./local.dart


/// Get an authenticated [GraphQLClient] for the github api
///
/// `graphql/client.dart` leverages the [gql_link][1] interface,
/// re-exporting [HttpLink], [WebsocketLink], [ErrorLink], and [DedupeLink],
/// in addition to the links we define ourselves (`AuthLink`)
///
/// [1]: https://pub.dev/packages/gql_link
GraphQLClient getGithubGraphQLClient() {
  final Link _link = HttpLink(
    'https://api.github.com/graphql',
    defaultHeaders: {
      'Authorization': 'Bearer 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',
    },
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}






/// query example - fetch all your github repositories
void readRepositories() async {
  final GraphQLClient _client = getGithubGraphQLClient();

  const int nRepositories = 50;

  final QueryOptions options = QueryOptions(
    document: gql(
      r'''
        query ReadRepositories($nRepositories: Int!) {
          viewer {
            repositories(last: $nRepositories) {
              nodes {
                __typename
                id
                name
                viewerHasStarred
              }
            }
          }
        }
      ''',
    ),
    variables: {
      'nRepositories': nRepositories,
    },
  );


  print("readRepositories readRepositories:  $readRepositories");

  final QueryResult result = await _client.query(options);
  print("readRepositories result:  $result");

  if (result.hasException) {
    stderr.writeln(result.exception.toString());
   // exit(2);
  }

  final List<dynamic> repositories =
  result.data!['viewer']['repositories']['nodes'] as List<dynamic>;
  print("readRepositories repositories:  ${repositories.length}  repositories daata: $repositories");

  repositories.forEach( (dynamic f) => {
          stdout.writeln('Id: ${f['id']} Name: ${f['name']}'),
          print("readRepositories forEach  Id: ${f['id']} Name: ${f['name']}"),
        },
  );

  //exit(0);
}






// mutation example - add star to repository
void starRepository(String? repositoryID) async {
  if (repositoryID == '') {
    stderr.writeln('The ID of the Repository is Required!');
    exit(2);
  }

  final GraphQLClient _client = getGithubGraphQLClient();

  final options = MutationOptions(
    document: gql(
      r'''
        mutation AddStar($starrableId: ID!) {
          action: addStar(input: {starrableId: $starrableId}) {
            starrable {
              viewerHasStarred
            }
          }
        }
      ''',
    ),
    variables: <String, dynamic>{
      'starrableId': repositoryID,
    },
  );

  final QueryResult result = await _client.mutate(options);

  if (result.hasException) {
    stderr.writeln(result.exception.toString());
    exit(2);
  }

  final bool isStarrred =
  result.data!['action']['starrable']['viewerHasStarred'] as bool;

  if (isStarrred) {
    stdout.writeln('Thanks for your star!');
  }

  exit(0);
}







// mutation example - remove star from repository
void removeStarFromRepository(String? repositoryID) async {
  if (repositoryID == '') {
    stderr.writeln('The ID of the Repository is Required!');
    exit(2);
  }

  final GraphQLClient _client = getGithubGraphQLClient();

  final MutationOptions options = MutationOptions(
    document: gql(
      r'''
        mutation RemoveStar($starrableId: ID!) {
          action: removeStar(input: {starrableId: $starrableId}) {
            starrable {
              viewerHasStarred
            }
          }
        }
      ''',
    ),
    variables: <String, dynamic>{
      'starrableId': repositoryID,
    },
  );

  final QueryResult result = await _client.mutate(options);

  if (result.hasException) {
    stderr.writeln(result.exception.toString());
    exit(2);
  }

  final bool isStarrred =
  result.data!['action']['starrable']['viewerHasStarred'] as bool;

  if (!isStarrred) {
    stdout.writeln('Sorry you changed your mind!');
  }

  exit(0);
}




//https://theno1plugshop.myshopify.com/admin/api/2022-10/products.json?
GraphQLClient shopifyGraphQLClient() {
  final Link _link = HttpLink(
     'https://theno1plugshop.myshopify.com/api/2022-10/graphql.json',
  defaultHeaders: {
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': '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',
      'fc75f9670c25cf20a8c12cf314596818': 'd48053a1be3d5d10df78d55189f6a202',
      'X-Shopify-Storefront-Access-Toke': '18b08ca37dc1de9fe56a50d734b0b56e'
    },
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}

/// query example - fetch all your github repositories
/// query ReadRepositories($nRepositories: Int!) {
//           viewer {
//             repositories(last: $nRepositories) {
void readProductData() async {
  final GraphQLClient _client = shopifyGraphQLClient();

 // const int first = 2;

  final QueryOptions options = QueryOptions(
    document: gql(
      r'''
        query products($first: Int!) {
  products(first: $first, reverse: true) {
    edges {
      node {
        id
        title
        handle
        resourcePublicationOnCurrentPublication {
          publication {
            name
            id
          }
          publishDate
          isPublished
        }
      }
    }
  }
}
      ''',
    ),
    variables: {
      'first': 50,
    },
  );


  print("readProductData readProductData:  $readRepositories");

  final QueryResult result = await _client.query(options);
  print("readProductData result:  $result");

  if (result.hasException) {
    stderr.writeln(result.exception.toString());
    // exit(2);
  }

  final List<dynamic> repositories =
  result.data!['products']['edges'] as List<dynamic>;
  print("readProductData repositories xxx :  ${repositories.length}  repositories daata: $repositories");

  repositories.forEach( (dynamic f) => {
    stdout.writeln('Id: ${f['id']} Name: ${f['title']}'),
    print("readProductData forEach  Id: ${f['id']} Name: ${f['title']}  Element: ${f['node']['title']}"),
  },
  );

  exit(0);
}



/*
  final options = MutationOptions(
    document: gql(
      r'''
        mutation AddStar($starrableId: ID!) {
          action: addStar(input: {starrableId: $starrableId}) {
            starrable {
              viewerHasStarred
            }
          }
        }
      ''',
    ),
    variables: <String, dynamic>{
      'starrableId': repositoryID,
    },
  );
 */
void AddToCartGraphQL() async {
  final GraphQLClient _client2 = shopifyGraphQLClient();

  final options2 = MutationOptions(
    document: gql(
      r''' 
        mutation {
          checkoutCreate(input: {
            lineItems: [{ variantId: "gid://shopify/40564486471838", quantity: 1 }]
          }) {
            checkout {
               id
               webUrl
               lineItems(first: 5) {
                 edges {
                   node {
                     title
                     quantity
                   }
                 }
               }
            }
          }
        }
      '''
    )
  );

 /* final options2 = MutationOptions(
    document: gql(
      r'''
      mutation {
  cartCreate(
    input: {
      lines: [{ quantity: 1, merchandiseId: "gid://shopify/ProductVariant/1" }]
      attributes: { key: "cart_attribute", value: "This is a cart attribute" }
    }
  ) {
    cart {
      id
      createdAt
      updatedAt
      lines(first: 10) {
        edges {
          node {
            id
            merchandise {
              ... on ProductVariant {
                id
              }
            }
          }
        }
      }
      attributes {
        key
        value
      }
      cost {
        totalAmount {
          amount
          currencyCode
        }
        subtotalAmount {
          amount
          currencyCode
        }
        totalTaxAmount {
          amount
          currencyCode
        }
        totalDutyAmount {
          amount
          currencyCode
        }
      }
    }
  }
}

      ''',
    ),
    variables: <String, dynamic>{
      'merchandiseId': 'gid://shopify/ProductVariant/40564486471838/1', //'''gid://shopify/Product/7908331159774',
    },
  );*/

  final QueryResult result = await _client2.mutate(options2);

  print("AddToCartGraphQL result:  $result");


  if (result.hasException) {
    stderr.writeln(result.exception.toString());
    print("AddToCartGraphQL hasException:  $result");
     exit(2);

  }

  final List<dynamic> repositories =
  result.data!['data']['cartCreate'] as List<dynamic>;
  print("AddToCartGraphQL repositories xxx :  ${repositories.length}  repositories daata: $repositories");

  repositories.forEach( (dynamic f) => {
   // stdout.writeln('Id: ${f['id']} Name: ${f['title']}'),
    print("AddToCartGraphQL forEach  Element: ${f}"),
  },
  );

  exit(0);
}
