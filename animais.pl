oi :- nl,
      write('Mantenha um animal em mente.'),
      nl,
      write('Basta responder sim / não às seguintes perguntas:'),
      nl, nl,
      guess(Animal),
      write('Este animal é um'),
      write(Animal),
      nl,
      undo.

/* hipóteses a serem testadas */
 advinhe(Leão          :- Leão, !.
adivinhe(veado)        :- veado, !.
adivinhe(vaca)			:- vaca, !.
adivinhe (urso)    :- urso,!.
adivinhe (zebra)   :- zebra,!.
adivinhe (cavalo)       :- cavalo,!.
adivinhe (girafa)   :- girafa,!.
adivinhe (ovelha)   :- ovelha,!.
adivinhe (coala)    :- coala,!.
adivinhe (canguru)  :- canguru,!.
adivinhe (hulhan)   :- hulhan,!.
adivinhe (esquilo)  :- esquilo,!.
adivinhe (gorila)   :- gorila,!.
adivinhe (baleia)   :- baleia,!.
adivinhe (golfinho)  :- golfinho,!.
adivinhe (morse)      :- morsa,!.
adivinhe (peixe-foca)  :- peixe-foca,!.
adivinhe (shimpanzee)  :- shimpanzee,!.
adivinhe (mouse)       :- mouse,!.
adivinhe (gato)         :- gato,!.
adivinhe (humano)      :- humano,!.
adivinhe (sahin)        :- sahin,!.
adivinhe (coruja)      :- coruja,!.
adivinhe (pombo)        :- pomba,!.
adivinhe (pinguim)        :- pinguim,!.
adivinhe (avestruz)       :- avestruz,!.
adivinhe (frango)         :- frango,!.
adivinhe (salamandra)     :- salamandra,!.
adivinhe (sapo)           :- sapo,!.
adivinhe (crocodilo)      :- crocodilo,!.
adivinhe (jacaré)         :- jacaré,!.
adivinhe (tartaruga)      :- tartaruga,!.
adivinhe (cobra)          :- cobra,!.
adivinhe (lagarto)        :- lagarto,!.
adivinhe (cação)         :- cação,!.
adivinhe (desconhecido).

/ * regras de identificação de animais * /
leão :- mamífero, carnívoro, verifique ().
vaca :- sangue quente, mamífero, herbívoro, tem cascos, verifique (chifre).
cervo :- hot_blooded, mamífero, herbívoro, verifique (boca).
Urso :- sangue quente, mamífero, carnívoro, marrom.
zebra :- de sangue quente, mamífero, herbívoro, com cascos, verifique (listrada preta).
cavalo :- sangue quente, mamífero, herbívoro, com cascos, verificar (.
Girafa :- sangue quente, mamífero, herbívoro, com cascos, verifique (pescoço longo).
ovelha :- sangue quente, mamífero, herbívoro, com cascos.
coala :- sangue quente, mamífero, herbívoro, marsupial, verifique (árvores_yashar).
canguru :- sangue quente, mamífero, herbívoro, marsupial, zips.
esquilo :- sangue quente, mamífero, herbívoro, verifique (olho).
gorila :- sangue quente, mamífero, herbívoro.
baleia :- sangue quente, mamífero, em condições de navegar, nadador, verifique ().
golfinho :  sangue quente, mamífero, gaivota, nadador, verifique (bico).
Peixe-porco :- sangue quente, mamífero, apto para o mar, rosto.
peixes-foca :- peixe, quente, mamífero, em condições de navegar.
shimpanzee :- sangue quente, mamífero, cauda, ​​marrom, verificar (adora banana).
Ratinho :- sangue quente, mamífero, cauda, ​​marrom.
Gato :- sangue quente, carnívoro, mamífero, cauda, ​​verifique (miados).
cão :- sangue quente, carnívoro, mamífero, cauda, ​​nadador.
humano :- sangue quente, mamífero, nadador.
sahin :- sangue quente, desperta, caça, verifica (tem asas_ longas).
Coruja :- sangue quente, despertar, caçar.
pinguim :- de sangue quente, flutuante, verifique (Antarcticada_yashiyor).
avestruz :- de sangue quente, verifique (tenha pescoço e pernas compridos).
Frango :- sangue quente.
salamandra :- anfíbio, cauda.
bolsa preta :- anfíbio, verifique (suspiroilli_kuru_derisi_var).
Sapo :- anfíbio, float, zips.
jacaré :- surungen, nadar, guclu_chene.
Tartaruga :- surge, sem concha, nadada.
cobra :- surungen, verifique ().
lagarto :- surungen.
Serpente :- peixe, verifique (tenha um corpo como um peixe comprido).

/ * classificação * /
carnívoro :- verificar (alimentar_ com outros animais).
sangue quente :- verifique (sangue quente).
mamífero :- verificar (comida).
herbívoro :- verificar (olhar).
anfíbio :- verificar (cor).
peixes :- verificar (se nada).
cauda :- verificar (tamanho).
com cascos :- verificar (ter cascos).
marsupial  :- verificar (sua prole no_bonito).
shell :- verificar (desconhecido).



ask(Question) :-
    write('Animal '),
    write(Question),
    write(' mi? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
      assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.


verify(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).


undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.
