-module(erl1).
-export([max3/3, reverse/1, square/1, cycleOnce/1, forthPower/1, factorial/1, getNth/2, fourthPower2/1, logarithm/2, largest/1, contains/2, count/2]).

max3(A,B,C) ->
 if 
	A > B ->
		if 
			A > C -> 
				A;
			true -> 
				C	
		end;
	true ->
		if 
			B > C -> 
				B;
			true ->
				C	
		end
 end.

reverse(L) ->
 if 
	L == [] ->
			[];
	true -> 
			reverse(tl(L)) ++ [hd(L)]
  end.

square(X) ->
    X * X.

cycleOnce(L) ->
    tl(L) ++ [hd(L) | []].

forthPower(X) ->
	X * X * X * X.

factorial(X) ->
	if X == 0 -> 1;
	   X == 1 -> 1;
	   true -> factorial(X-1)*X
	end.

getNth(N,L) ->
	if N == 1 -> hd(L);
	   true -> getNth(N-1,cycleOnce(L))
	end.

fourthPower2(X) ->
	square(X) * square(X).

logarithm(X,Y) ->
	if X == Y -> 1;
		true -> 1 + logarithm(X,Y/X)
	end.

largest(L) ->
	H = hd(L),
	T = tl(L),
	if (T == []) ->
		H;
	true ->
		if (H > hd(T)) ->
			largest([H|tl(T)]);
		true ->
			largest(T)
		end
	end.

contains(N,L) ->
 	if L == [] -> 
 		false;
  	true ->
  		if N == hd(L) -> 
  			true;
    	true -> 
    		contains(N, tl(L))
    	end
 	end.
 	
% % simplier form
% contains(N,L) ->
% 	if  L == [] -> 
% 		false;
%               N == hd(L) -> 
%  			true;
%  	    true -> 
%    		contains(N, tl(L))
% 	end.

count(N,L) ->
	if L == [] ->
		0;
	true ->
		if N == hd(L) ->
			1 + count(N,tl(L));
		true ->
			count(N,tl(L))
		end
	end.