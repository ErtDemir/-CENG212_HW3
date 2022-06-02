/*  Author : Ertuğrul Demir 260201059
If two innocent people contradict each other, the situation becomes paradoxical as we cannot know which one is lying.
Therefore, we cannot find the guilty person.
Due to such situations, today, if there are not many eyewitnesses, the statement given by someone cannot be used as evidence.
*/

murderer(X) :- bagof(Y,contradictPerson(X,Y),contradicts),length(contradicts,numberOfControdicts), numberOfContradicts > 1.


contradictPerson(A,B) :- not(isInnoMen(A,B)) , claims(A,AClaims), claims(B,BClaims), contradictClaims(AClaims,BClaims).

contradictClaims(Claims,[H|T]) :- contradictClaimsIter(Claims,H); contradictClaims(Claims,T).
contradictClaimsIter([H|T],C) :- contradictClaim(H,C); contradictClaimsIter(T,C).
contradictClaim([Claim1,Who],[Claim2,Who]) :- contradictory(Claim1,Claim2).

isInnoMen(A,B) :- claims(A,AClaims1), claims(B,BClaims1) , isInnoMen0(AClaims1,BClaims1).
isInnoMen0(Claims1,[H|_]) :- isInnoMen1(Claims1,H) .
isInnoMen1([H|_],D) :- isInno(H,D).
isInno([ClaimA|Who],[ClaimB,Who]) :- ( ClaimA = innocent) ,( ClaimB = innocent ).

claims(smith,[[innocent,smith],[friend,jones],[friend,williams]]).
claims(jones,[[innocent,jones],[outOfTown,jones],[notFriend,jones]]).
claims(williams,[[innocent,williams],[inTown,jones],[inTown,williams]]).
    
contradictory(innocent,murderer).
contradictory(murderer,innocent).
contradictory(outOfTown,inTown).
contradictory(inTown,outOfTown).
contradictory(friend,notFriend).
contradictory(notFriend,friend).