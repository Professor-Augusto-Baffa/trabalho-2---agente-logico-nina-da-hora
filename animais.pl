:-style_check(-singleton).
:- dynamic characteristic/2.
:- dynamic animals/12.
:- dynamic clearBase/1.
:- dynamic clearBase1/1.
:- dynamic play/0.
:- dynamic play/1.
:- dynamic question_carnivore/0.
:- dynamic question_herbivore/0.
:- dynamic question_omnivore/0.
:- dynamic question_fly/0.
:- dynamic question_Legs/0.
:- dynamic question_mammals/0.
:- dynamic question_doenstfly/0.
:- dynamic question_haslongLegs/0.
:- dynamic question_manfriend/0.
:- dynamic question_swims/0.
:- dynamic question_layeggs/0.

%symbolic fact 
characteristic(nothing, y_n).

clearBase(X):- clearBase1(X), fail.
  clearBase(X).
clearBase1(X):- retract(X).
  clearBase1(X).

% Main cast 
% Name, Carnivore, Herbivore, Omnivore, Fly, Legs, Mammals, DoenstFly, HasLongLegs, ManFriends, Swims, LayEggs 

animals('Pato', y, n, n, y, n, n, n, n, n, n, y, n). 
animals('Cachorro', y, n, y, n, y, y, y, n, y, y, n).
animals('Leao', y, n, n, n, y, y, y, n, n, y, n). 
animals('Tigre', y, n, n, n, y, y, y, n, n, y, n). 
animals('Pinguim', y, n, n, n, n, n, y, n, n, y, n). 
animals('Gato', y, n, y, n, y, y, y, n, n, y, n). 
animals('Abelha', n, y, n, y, y, n, n, n, n, n, y). 
animals('Porco', n, n, y, n, y, y, y, n, n, n, n). 
animals('Girafa', n, y, n, n, y, y, y, y, n, n, n).
animals('Elefante', n, y, n, n, y, y, y, n, n, n, n). 
animals('Passaro', n, y, y, y, y, y, y, n, n, n, n). 


play :-
  clearBase(characteristic(characteristic, Yn)),
  nl, write('Bem vindo ao Jogo dos Animais!'), nl, nl,
  question_carnivore.

play(y) :-
  play.

play(n) :-
  nl, write('Obrigada por jogar o jogo dos animais!'), nl, nl, !.

new_round :-
  nl, nl, write('Você gostaria de jogar novamente (y/n)?'),
      read(Desire),
      play(Desire).

question_carnivore :-
  write('O seu animal come carne (y/n)? '),
  read(AnswerCarnivore),
  asserta(characteristic(carnivore, AnswerCarnivore)),
  characteristic(carnivore, CarnivoreQuery),
  findall(X, animals(X, CarnivoreQuery, _, _, _, _, _, _, _, _, _, _, _), L),
  length(L, N), N == 1, 
  animals(Z, CarnivoreQuery, _, _, _, _, _, _, _, _, _, _, _), 
  write(' Hmm... Acho que...'), write(Z), write('!'), new_round;
  question_herbivore.


  question_herbivore :-
    write('O seu animal é Herbívoro(y/n)?'),
    read(AnswerHerbivore),
    asserta(characteristic(herbivore, AnswerHerbivore)),
    characteristic(carnivore, CarnivoreQuery),
    characteristic(herbivore, HerbivoreQuery),
    findall(X, animals(X, CarnivoreQuery, HerbivoreQuery, _, _, _, _, _, _, _, _, _),L),
    length(L, N), N == 1,
    animals(Z, CarnivoreQuery, HerbivoreQuery, _, _, _, _, _, _, _, _, _),
    write('Hmm ... Acho que...'), write(Z), write('!'), new_round;
    question_omnivore.


  question_omnivore :-
    write('O seu animal é Onĩvoro(y/n)?'),
    read(AnswerOmnivore),
    asserta(characteristic(Omnivore, AnswerOmnivore)),
    characteristic(carnivore, CarnivoreQuery),
    characteristic(herbivore, HerbivoreQuery),
    characteristic(omnivore, OmnivoeQuery),
    findall(X, animals(X, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery, _, _, _, _, _, _, _, _),L),
    length(L, N), N == 1,
    animals(Z, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery, _, _, _, _, _, _, _, _),
    write('Humm...Acho que...'), write(Z), write('!'), new_round;
    question_fly.


question_fly :-
    write('O seu animal sabe voar (y/n)?'),
    read(AnswerFly),
    asserta(characteristic(Fly, AnswerFly)),
    characteristic(carnivore, CarnivoreQuery),
    characteristic(herbivore, HerbivoreQuery),
    characteristic(omnivore, OmnivoeQuery),
    characteristic(fly, FlyQuery),
    findall(X, animals(X, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery, _, _, _, _, _, _, _),L),
    length(L, N), N == 1,
    animals(Z, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery, _, _, _, _, _, _, _),
    write('Humm...Acho que...'), write(Z), write('!'), new_round;
    question_Legs.


question_Legs :-
    write('O seu animal tem 4 pernas (y/n)?'),
    read(AnswerLegs),
    asserta(characteristic(Legs, AnswerLegs)),
    characteristic(carnivore, CarnivoreQuery),
    characteristic(herbivore, HerbivoreQuery),
    characteristic(omnivore, OmnivoeQuery),
    characteristic(fly, FlyQuery),
    characteristic(Legs, LegsQuery),
    findall(X, animals(X, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, _, _, _, _, _, _),L),
    length(L, N), N == 1,
    animals(Z, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, _, _, _, _, _, _),
    write('Humm...Acho que...'), write(Z), write('!'), new_round;
    question_mammals.



question_mammals :-
    write('O seu animal tem pelos no corpo (y/n)?'),
    read(AnswerMammals),
    asserta(characteristic(mammals, AnswerMammals)),
    characteristic(carnivore, CarnivoreQuery),
    characteristic(herbivore, HerbivoreQuery),
    characteristic(omnivore, OmnivoeQuery),
    characteristic(fly, FlyQuery),
    characteristic(Legs, LegsQuery),
    characteristic(mammals, MammalsQuery),
    findall(X, animals(X, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, _, _, _, _, _),L),
    length(L, N), N == 1,
    animals(Z, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, _, _, _, _, _),
    write('Humm...Acho que...'), write(Z), write('!'), new_round;
    question_doenstfly.


question_doenstfly :-
    write('O seu animal não voa (y/n)?'),
    read(AnswerDoenstfly),
    asserta(characteristic(doenstfly, AnswerDoenstfly)),
    characteristic(carnivore, CarnivoreQuery),
    characteristic(herbivore, HerbivoreQuery),
    characteristic(omnivore, OmnivoeQuery),
    characteristic(fly, FlyQuery),
    characteristic(Legs, LegsQuery),
    characteristic(mammals, MammalsQuery),
    characteristic(doenstfly, DoenstflyQuery),
    findall(X, animals(X, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, DoenstflyQuery, _, _, _, _),L),
    length(L, N), N == 1,
    animals(Z, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, DoenstflyQuery, _, _, _, _),
    write('Humm...Acho que...'), write(Z), write('!'), new_round;
    question_haslongLegs.



question_haslongLegs :-
    write('O seu animal tem pernas longas (y/n)?'),
    read(AnswerHaslongLegs),
    asserta(characteristic(haslongLegs, AnswerHaslongLegs)),
    characteristic(carnivore, CarnivoreQuery),
    characteristic(herbivore, HerbivoreQuery),
    characteristic(omnivore, OmnivoeQuery),
    characteristic(fly, FlyQuery),
    characteristic(Legs, LegsQuery),
    characteristic(mammals, MammalsQuery),
    characteristic(doenstfly, DoenstflyQuery),
    characteristic(haslongLegs, HaslongLegsQuery),
    findall(X, animals(X, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, DoenstflyQuery,HaslongLegsQuery, _, _, _),L),
    length(L, N), N == 1,
    animals(Z, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, DoenstflyQuery,HaslongLegsQuery, _, _, _),
    write('Humm...Acho que...'), write(Z), write('!'), new_round;
    question_manfriend.


question_manfriend :-
    write('O seu animal é considerado amigo do homem (y/n)?'),
    read(AnswerManfriend),
    asserta(characteristic(manfriend, AnswerManfriend)),
    characteristic(carnivore, CarnivoreQuery),
    characteristic(herbivore, HerbivoreQuery),
    characteristic(omnivore, OmnivoeQuery),
    characteristic(fly, FlyQuery),
    characteristic(Legs, LegsQuery),
    characteristic(mammals, MammalsQuery),
    characteristic(doenstfly, DoenstflyQuery),
    characteristic(haslongLegs, HaslongLegsQuery),
     characteristic(manfriend, ManfriendQuery),
    findall(X, animals(X, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, DoenstflyQuery,HaslongLegsQuery,ManfriendQuery, _, _),L),
    length(L, N), N == 1,
    animals(Z, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, DoenstflyQuery,HaslongLegsQuery,ManfriendQuery, _, _),
    write('Humm...Acho que...'), write(Z), write('!'), new_round;
    question_swims.


question_swims:-
    write('O seu animal sabe nadar (y/n)?'),
    read(AnswerSwims),
    asserta(characteristic(swims, AnswerSwims)),
    characteristic(carnivore, CarnivoreQuery),
    characteristic(herbivore, HerbivoreQuery),
    characteristic(omnivore, OmnivoeQuery),
    characteristic(fly, FlyQuery),
    characteristic(Legs, LegsQuery),
    characteristic(mammals, MammalsQuery),
    characteristic(doenstfly, DoenstflyQuery),
    characteristic(haslongLegs, HaslongLegsQuery),
    characteristic(manfriend, ManfriendQuery),
    characteristic(swims, SwimsQuery),
    findall(X, animals(X, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, DoenstflyQuery,HaslongLegsQuery,ManfriendQuery,SwimsQuery, _),L),
    length(L, N), N == 1,
    animals(Z, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, DoenstflyQuery,HaslongLegsQuery,ManfriendQuery, SwimsQuery, _),
    write('Humm...Acho que...'), write(Z), write('!'), new_round;
    question_layeggs.

question_layeggs:-
    write('O seu animal põe ovos (y/n)?'),
    read(AnswerLayeggs),
    asserta(characteristic(layeggs, AnswerLayeggs)),
    characteristic(carnivore, CarnivoreQuery),
    characteristic(herbivore, HerbivoreQuery),
    characteristic(omnivore, OmnivoeQuery),
    characteristic(fly, FlyQuery),
    characteristic(Legs, LegsQuery),
    characteristic(mammals, MammalsQuery),
    characteristic(doenstfly, DoenstflyQuery),
    characteristic(haslongLegs, HaslongLegsQuery),
    characteristic(manfriend, ManfriendQuery),
    characteristic(swims, SwimsQuery),
    characteristic(layeggs, LayeggsQuery),
    findall(X, animals(X, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, DoenstflyQuery,HaslongLegsQuery,ManfriendQuery,SwimsQuery, LayeggsQuery),L),
    length(L, N), N == 1,
    animals(Z, CarnivoreQuery, HerbivoreQuery, OmnivoeQuery,FlyQuery,LegsQuery, MammalsQuery, DoenstflyQuery,HaslongLegsQuery,ManfriendQuery, SwimsQuery, LayeggsQuery),
    write('Humm...Acho que...'), write(Z), write('!'), new_round;
    write('Arghhh!!! Não!!!'), new_round.
