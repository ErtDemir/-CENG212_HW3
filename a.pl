/*  Author : Ertuğrul Demir 260201059
If a person's statement contradicts the other two, that person is likely guilty.
*/
murderer(X) :- bagof(Y,contradictPerson(X,Y),contradicts), length(contradicts,numberOfContradicts), numberOfContradicts > 1.


contradictPerson(A,B) :- claims(A,AClaims), claims(B,BClaims), contradictClaims(AClaims,BClaims).

contradictClaims(Claims,[H|T]) :- contradictClaimsIter(Claims,H); contradictClaims(Claims,T).
contradictClaimsIter([H|T],C) :- contradictClaim(H,C); contradictClaimsIter(T,C).
contradictClaim([Claim1,Who],[Claim2,Who]) :- contradictory(Claim1,Claim2).

claims(smith,[[innocent,smith],[friend,jones],[friend,williams]]).
claims(jones,[[innocent,jones],[outOfTown,jones],[notFriend,jones]]).
claims(williams,[[innocent,williams],[inTown,jones],[inTown,williams]]).
    
contradictory(innocent,murderer).
contradictory(murderer,innocent).
contradictory(outOfTown,inTown).
contradictory(inTown,outOfTown).
contradictory(friend,notFriend).
contradictory(notFriend,friend).