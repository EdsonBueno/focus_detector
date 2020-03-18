import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:focusdetectorexample/presentation/home_screen.dart';
import 'package:focusdetectorexample/presentation/route_name_builder.dart';
import 'package:focusdetectorexample/presentation/scene/character/detail/character_detail_page.dart';
import 'package:focusdetectorexample/presentation/scene/character/list/character_list_page.dart';
import 'package:focusdetectorexample/presentation/scene/quote/quote_list_page.dart';

void main() {
  // Detailed tutorial on this routing setup:
  // https://edsonbueno.com/2020/02/26/spotless-routing-and-navigation-in-flutter/
  Router.appRouter
    // The '..' syntax is a Dart feature called cascade notation.
    // Further reading: https://dart.dev/guides/language/language-tour#cascade-notation-
    ..define(
      '/',
      // Handler is a custom Fluro's class, in which you define the route's
      // widget builder as the Handler.handlerFunc.
      handler: Handler(
        handlerFunc: (context, params) => HomeScreen(),
      ),
    )
    ..define(
      RouteNameBuilder.charactersResource,
      handler: Handler(
        handlerFunc: (context, params) => CharacterListPage(),
      ),
    )
    ..define(
      '${RouteNameBuilder.charactersResource}/:id',
      // The ':id' syntax is how we tell Fluro to parse whatever comes in
      // that location and give it a name of 'id'. This is called a Path Param
      // or URI Param.
      transitionType: TransitionType.native,
      handler: Handler(
        handlerFunc: (context, params) {
          // The 'params' is a dictionary where the key is the name we gave to
          // the parameter ('id' in this case), and the value is an array with
          // all the arguments that were provided (just a single `int` in this
          // case). Fluro gives us an array as the value instead of a single
          // item because when we're working with query string parameters,
          // we're able to pass an array as the argument, such as
          // '?name=Jesse,Walter,Gus'.
          final id = int.parse(params['id'][0]);
          return CharacterDetailPage(
            id: id,
          );
        },
      ),
    )
    ..define(
      RouteNameBuilder.quotesResource,
      handler: Handler(
        handlerFunc: (context, params) => QuoteListPage(),
      ),
    )
    ..define(
      // This route will accept a Query Param, but notice that, unlike we did
      // with Path Params, we don't need to pre-define our expected Query
      // Params in the path String.
      '${RouteNameBuilder.quotesResource}/${RouteNameBuilder.authorsResource}',
      // You can customize the transition type for every route.
      transitionType: TransitionType.nativeModal,
      handler: Handler(
        handlerFunc: (context, params) {
          // We extract an expected Query Param just as we did with
          // the 'id' in the third route definition. The only difference being
          // that with Query Params we didn't need to specify it in the
          // 'quotes/authors' route path.
          final name = params['name'][0];
          return CharacterDetailPage(
            name: name,
          );
        },
      ),
    );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'FocusDetector Example',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // We could have written it as:
        // onGenerateRoute: (routeSettings) =>
        //    Router.appRouter.generator(routeSettings)
        // This shorter syntax is a Dart feature called a `tear-off`.
        // https://dart.dev/guides/language/effective-dart/usage#dont-create-a-lambda-when-a-tear-off-will-do
        onGenerateRoute: Router.appRouter.generator,
      );
}
