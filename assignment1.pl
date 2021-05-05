
/**

1:	s(T, [the, young, boy, pushed, and, stored , a , big, box, in, the, large, empty, room, after, school], []).

2:	s(T, [the, old , woman, and, the , old , man ,gave, the, poor, young, man, a, white, envelope, in, the, shed, behind, the, building], []).

3:	s(T, [every, boy, quickly, climbed, some, big, tree, and, every, girl, watched, some, boy], []).

4:	s(T, [some, brilliant, students, and, many, professors, watched, and, admired, talented, lecturers, and, appreciated, bright, scientists, and, researchers], []).

5:	s(T, [who, climbed, the, big, tree], []).

5:	s(T, [what, did, the, professors, do], []).
swipl -s assignment1.pl
halt.
*/


/** 
Refs 
https://www.cs.rochester.edu/u/brown/173/lectures/logic/prolog/DCGlec.html
https://en.wikipedia.org/wiki/Definite_clause_grammar
*/


s(s(A,B))-->simple_sentence(A),sentence(B).
simple_sentence(s(NOUNPHRASE,VERBPHRASE))-->noun_phrase(NOUNPHRASE),verb_phrase(VERBPHRASE).
sentence(s(C,A,B))-->conjunction(C),simple_sentence(A),sentence(B).
sentence(s(_))-->[].


noun_phrase(nounPhrase(NOUN))-->noun(NOUN).
noun_phrase(nounPhrase(DET,NOUN))-->det(DET),noun(NOUN).
noun_phrase(nounPhrase(DET,ADJ,NOUN))-->det(DET),adj_phrase(ADJ),noun(NOUN).
noun_phrase(nounPhrase(DET,ADJ,NOUN,CONJ,NOUNPHRASE))-->det(DET),adj_phrase(ADJ),noun(NOUN),conjunction(CONJ),noun_phrase(NOUNPHRASE).
noun_phrase(nounPhrase(DET,ADJ,NOUN,PRON))-->det(DET),adj_phrase(ADJ),noun(NOUN),pronoun_phrase(PRON).
noun_phrase(nounPhrase(DET,ADJ,NOUN,PREPPHRASE))-->det(DET),adj_phrase(ADJ),noun(NOUN),preposition_phrase(PREPPHRASE).
noun_phrase(nounPhrase(DET,NOUN,PREPPHRASE))-->det(DET),noun(NOUN),preposition_phrase(PREPPHRASE).
noun_phrase(nounPhrase(DET,NOUN,PRON))-->det(DET),noun(NOUN),pronoun_phrase(PRON).
noun_phrase(nounPhrase(DET,ADJ,NOUN,NOUNPHRASE))-->det(DET),adj_phrase(ADJ),noun(NOUN),noun_phrase(NOUNPHRASE).
noun_phrase(nounPhrase(DET,ADJ,NOUN,PRON))-->det(DET),adj_phrase(ADJ),noun(NOUN),preposition_phrase(PRON).
noun_phrase(nounPhrase(DET,ADJ,NOUN,PRON))-->det(DET),adj_phrase(ADJ),noun(NOUN),adverb_phrase(PRON).
noun_phrase(nounPhrase(DET,NOUN,PRON))-->det(DET),noun(NOUN),adverb_phrase(PRON).
noun_phrase(nounPhrase(DET,ADJ,NOUN,NOUNPHRASE))-->det(DET),adj_phrase(ADJ),noun(NOUN),noun_phrase(NOUNPHRASE).
noun_phrase(nounPhrase(ADJ,NOUN))-->adj_phrase(ADJ),noun(NOUN).
noun_phrase(nounPhrase(ADJ,NOUN,CONJ,VERBPHRASE))-->adj_phrase(ADJ),noun(NOUN),conjunction(CONJ),verb_phrase(VERBPHRASE).
noun_phrase(nounPhrase(ADJ,NOUN,CONJ,VERBPHRASE))-->adj_phrase(ADJ),noun(NOUN),conjunction(CONJ),noun_phrase(VERBPHRASE).


verb_phrase(verbPhrase(VERB))-->verb(VERB).
verb_phrase(verbPhrase(VERB,CONJ,VERBPHRASE))-->verb(VERB),conjunction(CONJ),verb_phrase(VERBPHRASE).
verb_phrase(verbPhrase(VERB,ADJ))-->verb(VERB),pronoun_phrase(ADJ).
verb_phrase(verbPhrase(VERB,NOUNPHRASE))-->verb(VERB),noun_phrase(NOUNPHRASE).
verb_phrase(verbPhrase(VERB,NOUNPHRASE,ADJ))-->verb(VERB),noun_phrase(NOUNPHRASE),adverb_phrase(ADJ).
verb_phrase(verbPhrase(VERB,NOUNPHRASE,PREPPHRASE))-->verb(VERB),noun_phrase(NOUNPHRASE),preposition_phrase(PREPPHRASE).
verb_phrase(verbPhrase(VERB,PREPPHRASE))-->verb(VERB),preposition_phrase(PREPPHRASE).
verb_phrase(verbPhrase(VERB))-->adverb_phrase(VERB).

preposition_phrase(prep(DET))-->preposition(DET).
preposition_phrase(prep(DET,NOUNPHRASE))-->preposition(DET),noun_phrase(NOUNPHRASE).

adj_phrase(adj(ADJ))-->adjective(ADJ).
adj_phrase(adj(ADJ,ADJPHRASE))-->adjective(ADJ),adj_phrase(ADJPHRASE).

adverb_phrase(adv(ADV,VERBPHRASE))-->adverb(adv(ADV)),verb_phrase(VERBPHRASE).

pronoun_phrase(pronounPhrase(PRON,VERBPHRASE))-->pronoun(PRON),verb_phrase(VERBPHRASE).
pronoun_phrase(pronounPhrase(PRON))-->pronoun(PRON).
pronoun_phrase(pronounPhrase(PRON,NOUNPHRASE))-->pronoun(PRON),noun_phrase(NOUNPHRASE).

%Nouns
noun(n(paper))-->[paper].
noun(n(students))-->[students].
noun(n(love))-->[love].
noun(n(girl))-->[girl].
noun(n(man))-->[man].
noun(n(room))-->[room].
noun(n(warmth))-->[warmth].
noun(n(woman))-->[woman].
noun(n(letters))-->[letters].
noun(n(zone))-->[zone].
noun(n(writings))-->[writings].
noun(n(scientists))-->[scientists].
noun(n(idea))-->[idea].
noun(n(lecturers))-->[lecturers].
noun(n(building))-->[building].
noun(n(box))-->[box].
noun(n(professors))-->[professors].
noun(n(area))-->[area].
noun(n(plant))-->[plant].
noun(n(school))-->[school].
noun(n(researchers))-->[researchers].
noun(n(tree))-->[tree].
noun(n(university))-->[university].
noun(n(boy))-->[boy].
noun(n(number))-->[number].
noun(n(shed))-->[shed].
noun(n(theatre))-->[theatre].
noun(n(envelope))-->[envelope].


%Verbs
verb(v(ask))-->[ask].
verb(v(asked))-->[asked].
verb(v(eat))-->[eat].
verb(v(ate))-->[ate].
verb(v(jumped))-->[jumped].
verb(v(travel))-->[travel].
verb(v(replaced))-->[replaced].
verb(v(listen))-->[listen].
verb(v(appreciated))-->[appreciated].
verb(v(pushed))-->[pushed].
verb(v(sleep))-->[sleep].
verb(v(played))-->[played].
verb(v(connect))-->[connect].
verb(v(push))-->[push].
verb(v(watched))-->[watched].
verb(v(gave))-->[gave].
verb(v(did))-->[did].
verb(v(do))-->[do].
verb(v(admired))-->[admired].
verb(v(ran))-->[ran].
verb(v(stored))-->[stored].
verb(v(kill))-->[kill].
verb(v(killed))-->[killed].
verb(v(see))-->[see].
verb(v(saw))-->[saw].
verb(v(climbed))-->[climbed].
verb(v(run))-->[run].
verb(v(saw))-->[saw].
verb(v(throw))-->[throw].
verb(v(threw))-->[threw].
verb(v(yell))-->[yell].
verb(v(yelled))-->[yelled].
verb(v(put))-->[put].
verb(v(worked))-->[worked].

%Adjectives
adjective(adj(bright))-->[bright].
adjective(adj(gentle))-->[gentle].
adjective(adj(fierce))-->[fierce].
adjective(adj(ambitious))-->[ambitious].
adjective(adj(soft))-->[soft].
adjective(adj(happy))-->[happy].
adjective(adj(entertaining))-->[entertaining].
adjective(adj(amusing))-->[amusing].
adjective(adj(old))-->[old].
adjective(adj(empty))-->[empty].
adjective(adj(beautiful))-->[beautiful].
adjective(adj(exciting))-->[exciting].
adjective(adj(nervous))-->[nervous].
adjective(adj(large))-->[large].
adjective(adj(hard))-->[hard].
adjective(adj(brilliant))-->[brilliant].
adjective(adj(loving))-->[loving].
adjective(adj(rich))-->[rich].
adjective(adj(young))-->[young].
adjective(adj(poor))-->[poor].
adjective(adj(sad))-->[sad].
adjective(adj(talented))-->[talented].
adjective(adj(calm))-->[calm].
adjective(adj(big))-->[big].
adjective(adj(white))-->[white].

%Adverbs
adverb(adv(quickly))-->[quickly].
adverb(adv(together))-->[together].
adverb(adv(innocently))-->[innocently].
adverb(adv(always))-->[always].
adverb(adv(strictly))-->[strictly].
adverb(adv(likely))-->[likely].
adverb(adv(faithfully))-->[faithfully].
adverb(adv(carelessly))-->[carelessly].
adverb(adv(secretly))-->[secretly].
adverb(adv(often))-->[often].

%Prepositions
preposition(prep(after))-->[after].
preposition(prep(behind))-->[behind].
preposition(prep(under))-->[under].
preposition(prep(for))-->[for].
preposition(prep(between))-->[between].
preposition(prep(before))-->[before].
preposition(prep(at))-->[at].
preposition(prep(above))-->[above].
preposition(prep(in))-->[in].
preposition(prep(with))-->[with].
preposition(prep(within))-->[within].

%Determiner
det(d(these))-->[these].
det(d(those))-->[those].
det(d(an))-->[an].
det(d(other))-->[other].
det(d(any))-->[any].
det(d(that))-->[that].
det(d(the))-->[the].
det(d(a))-->[a].
det(d(such))-->[such].
det(d(every))-->[every].
det(d(this))-->[this].
det(d(many))-->[many].
det(d(some))-->[some].

%Conjunctions
conjunction(conj(and))-->[and].
conjunction(conj(while))-->[while].
conjunction(conj(or))-->[or].
conjunction(conj(but))-->[but].

%Pronouns
pronoun(pron(me))-->[me].
pronoun(pron(i))-->[i].
pronoun(pron(us))-->[us].
pronoun(pron(we))-->[we].
pronoun(pron(who))-->[who].
pronoun(pron(what))-->[what].