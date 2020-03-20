%%%-------------------------------------------------------------------
%%% @author botht
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Mar 2020 20:55
%%%-------------------------------------------------------------------
-module(erlang_functions).
-author("botht").

%% API
-export([print/0, reverse/1, find/2, delete/2, flatten/1, square/1, list_max/1, list_min/1, filter/2]).


print() -> io:format("Test~n").

%%---------------- reverse --------------------
reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].

%%------------------- find ----------------------
find(_,[]) -> io:format("not_found ~n");
find(X,[X|T]) -> io:format("{found ~p} ~n", [X]);
find(X, [H|T]) -> find(X, T).

%%------------------- delete ----------------------
delete(_, []) -> [];
delete(X, [X|T]) -> T;
delete(X, [H|T]) -> [H|delete(X, T)].

%%------------------- flatten ----------------------
flatten([]) -> [];
flatten([L|Lx]) -> L ++ flatten(Lx).

%%------------------- square ----------------------
square([]) -> [];
square([H|T]) -> [H*H|square(T)].

%%------------------- filter ----------------------
%%filter = ????
filter(_, []) -> [];
filter(F, [H|T]) ->
  case F(H) of
    true -> [H|filter(F, T)] ;
    false -> filter(F, T)
  end.

%%--------------------- max ------------------------
list_max([]) -> io:format("empty list");
list_max([H|T]) -> io:format("max: ~p ~n", [list_max(H, T)]).

list_max(X, []) -> X;
list_max(X, [H|T]) when X < H  -> list_max(H,T);
list_max(X, [_|T]) -> list_max(X, T).

%%--------------------- min ------------------------
list_min([]) -> io:format("empty list");
list_min([H|T]) -> io:format("min: ~p ~n", [list_min(H, T)]).

list_min(X, []) -> X;
list_min(X, [H|T]) when X > H  -> list_min(H,T);
list_min(X, [_|T]) -> list_min(X, T).

