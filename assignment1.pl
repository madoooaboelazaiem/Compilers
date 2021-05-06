
/**

1:	s(T, [the, young, boy, pushed, and, stored , a , big, box, in, the, large, empty, room, after, school], []).

2:	s(T, [the, old , woman, and, the , old , man ,gave, the, poor, young, man, a, white, envelope, in, the, shed, behind, the, building], []).

3:	s(T, [every, boy, quickly, climbed, some, big, tree, and, every, girl, watched, some, boy], []).

4:	s(T, [some, brilliant, students, and, many, professors, watched, and, admired, talented, lecturers, and, appreciated, bright, scientists, and, researchers], []).

5:	s(T, [who, climbed, the, big, tree], []).

6:	s(T, [how, did, this, happen], []).

7:	s(T, [what, did, the, professors, do], []).

8:	s(T, [when, and, how, did, this, happen], []).

9:	s(T, [how, have, he, been], []).

9:	s(T, [how, have, he, been, i, heard, the, young, boy, pushed, and, stored , a , big, box, in, the, large, empty, room, after, school], []).


swipl -s assignment1.pl
halt.
s(s(A,B))-->simple_sentence(A),sentence(B).
s(s(I,B))-->interrogative_sentence(I),sentence(B).
simple_sentence(s(NOUNPHRASE,VERBPHRASE))-->noun_phrase(NOUNPHRASE),verb_phrase(VERBPHRASE).
simple_sentence(s(NOUNPHRASE,VERBPHRASE,END))-->noun_phrase(NOUNPHRASE),verb_phrase(VERBPHRASE),punctuation(END).
sentence(s(C,A,B))-->conjunction(C),simple_sentence(A),sentence(B).
sentence(s(C,A,B,END))-->conjunction(C),simple_sentence(A),sentence(B),punctuation(END).

sentence(s(_))-->[].
interrogative_sentence(s(INTEROPHRASE,VERBPHRASE))-->interrogative_pronoun_phrase(INTEROPHRASE),verb_phrase(VERBPHRASE).
interrogative_sentence(s(INTEROPRON,CONJ, INTEROPHRASE))-->interPronoun(INTEROPRON),conjunction(CONJ),interrogative_pronoun_phrase(INTEROPHRASE).
interrogative_sentence(s(INTEROPHRASE,VERBPHRASE,END))-->interrogative_pronoun_phrase(INTEROPHRASE),verb_phrase(VERBPHRASE),punctuation(END).
interrogative_sentence(s(INTEROPRON,CONJ, INTEROPHRASE,END))-->interPronoun(INTEROPRON),conjunction(CONJ),interrogative_pronoun_phrase(INTEROPHRASE),punctuation(END).
*/

/** 
Refs 
https://www.cs.rochester.edu/u/brown/173/lectures/logic/prolog/DCGlec.html
https://en.wikipedia.org/wiki/Definite_clause_grammar
*/


s(s(B))-->sentence(B).
sentence(s(C,B))-->conjunction(C),sentence(B).
sentence(s(C,B,END))-->conjunction(C),sentence(B),punctuation(END).
sentence(s(NOUNPHRASE,VERBPHRASE))-->noun_phrase(NOUNPHRASE),verb_phrase(VERBPHRASE).
sentence(s(NOUNPHRASE,VERBPHRASE,END))-->noun_phrase(NOUNPHRASE),verb_phrase(VERBPHRASE),punctuation(END).
sentence(s(INTEROPHRASE,VERBPHRASE))-->interrogative_pronoun_phrase(INTEROPHRASE),verb_phrase(VERBPHRASE).
sentence(s(INTEROPRON,CONJ, INTEROPHRASE))-->interPronoun(INTEROPRON),conjunction(CONJ),interrogative_pronoun_phrase(INTEROPHRASE).
sentence(s(INTEROPHRASE,VERBPHRASE,END))-->interrogative_pronoun_phrase(INTEROPHRASE),verb_phrase(VERBPHRASE),punctuation(END).
sentence(s(INTEROPRON,CONJ, INTEROPHRASE,END))-->interPronoun(INTEROPRON),conjunction(CONJ),interrogative_pronoun_phrase(INTEROPHRASE),punctuation(END).

noun_phrase(nounPhrase(NOUN))-->noun(NOUN).
noun_phrase(nounPhrase(DET,NOUN))-->det(DET),noun(NOUN).
noun_phrase(nounPhrase(DET,ADJ,NOUN))-->det(DET),adj_phrase(ADJ),noun(NOUN).
noun_phrase(nounPhrase(NOUN,CONJ,NOUNPHRASE))-->noun(NOUN),conjunction(CONJ),noun_phrase(NOUNPHRASE).
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
noun_phrase(nounPhrase(ADJ,NOUN,CONJ,NOUNPHRASE))-->adj_phrase(ADJ),noun(NOUN),conjunction(CONJ),noun_phrase(NOUNPHRASE).
noun_phrase(nounPhrase(DET,NOUN,CONJ,NOUNPHRASE))-->det(DET),noun(NOUN),conjunction(CONJ),noun_phrase(NOUNPHRASE).

verb_phrase(verbPhrase(VERB))-->verb(VERB).
verb_phrase(verbPhrase(VERB,CONJ,VERBPHRASE))-->verb(VERB),conjunction(CONJ),verb_phrase(VERBPHRASE).
verb_phrase(verbPhrase(VERB,ADJ))-->verb(VERB),pronoun_phrase(ADJ).
verb_phrase(verbPhrase(VERB,DET,VERBPHRASE))-->verb(VERB),det(DET),verb_phrase(VERBPHRASE).
verb_phrase(verbPhrase(VERB,NOUNPHRASE))-->verb(VERB),noun_phrase(NOUNPHRASE).
verb_phrase(verbPhrase(VERB,NOUNPHRASE,ADJ))-->verb(VERB),noun_phrase(NOUNPHRASE),adverb_phrase(ADJ).
verb_phrase(verbPhrase(VERB,NOUNPHRASE,PREPPHRASE))-->verb(VERB),noun_phrase(NOUNPHRASE),preposition_phrase(PREPPHRASE).
verb_phrase(verbPhrase(VERB,PREPPHRASE))-->verb(VERB),preposition_phrase(PREPPHRASE).
verb_phrase(verbPhrase(VERB))-->adverb_phrase(VERB).

preposition_phrase(prep(PREP))-->preposition(PREP).
preposition_phrase(prep(PREP,NOUNPHRASE))-->preposition(PREP),noun_phrase(NOUNPHRASE).
preposition_phrase(prep(PREP,VERBPHRASE))-->preposition(PREP),verb_phrase(VERBPHRASE).

adj_phrase(adj(ADJ))-->adjective(ADJ).
adj_phrase(adj(ADJ,ADJPHRASE))-->adjective(ADJ),adj_phrase(ADJPHRASE).

adverb_phrase(adv(ADV,VERBPHRASE))-->adverb(adv(ADV)),verb_phrase(VERBPHRASE).

pronoun_phrase(pronounPhrase(PRON,VERBPHRASE))-->pronoun(PRON),verb_phrase(VERBPHRASE).
pronoun_phrase(pronounPhrase(PRON))-->pronoun(PRON).
pronoun_phrase(pronounPhrase(PRON,NOUNPHRASE))-->pronoun(PRON),noun_phrase(NOUNPHRASE).

interrogative_pronoun_phrase(interPronounP(PRON))-->interPronoun(PRON).
interrogative_pronoun_phrase(interPronounP(PRON,VERBPHRASE))--> interPronoun(PRON),verb_phrase(VERBPHRASE).


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
noun(n(lawyers))-->[lawyers].
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
noun(n(year))-->[year].
noun(n(person))-->[person].
noun(n(time))-->[time].
noun(n(way))-->[way].
noun(n(day))-->[day].
noun(n(thing))-->[thing].
noun(n(world))-->[world].
noun(n(life))-->[life].
noun(n(hand))-->[hand].
noun(n(part))-->[part].
noun(n(child))-->[child].
noun(n(eye))-->[eye].
noun(n(child))-->[child].
noun(n(place))-->[place].
noun(n(work))-->[work].
noun(n(week))-->[week].
noun(n(case))-->[case].
noun(n(government))-->[government].



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
verb(v(connected))-->[connected].
verb(v(push))-->[push].
verb(v(watched))-->[watched].
verb(v(gave))-->[gave].
verb(v(did))-->[did].
verb(v(doing))-->[doing].
verb(v(does))-->[does].
verb(v(do))-->[do].
verb(v(have))-->[have].
verb(v(had))-->[had].
verb(v(be))-->[be].
verb(v(been))-->[been].
verb(v(admired))-->[admired].
verb(v(ran))-->[ran].
verb(v(stored))-->[stored].
verb(v(kill))-->[kill].
verb(v(killed))-->[killed].
verb(v(see))-->[see].
verb(v(climbed))-->[climbed].
verb(v(run))-->[run].
verb(v(saw))-->[saw].
verb(v(throw))-->[throw].
verb(v(threw))-->[threw].
verb(v(yell))-->[yell].
verb(v(yelled))-->[yelled].
verb(v(put))-->[put].
verb(v(worked))-->[worked].
verb(v(happen))-->[happen].
verb(v(hear))-->[hear].
verb(v(heard))-->[heard].
verb(v(like))-->[like].
verb(v(liked))-->[liked].


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
adjective(adj(one))-->[one].
adjective(adj(two))-->[two].
adjective(adj(three))-->[three].
adjective(adj(four))-->[four].
adjective(adj(five))-->[five].
adjective(adj(six))-->[six].
adjective(adj(seven))-->[seven].
adjective(adj(eight))-->[eight].
adjective(adj(nine))-->[nine].
adjective(adj(ten))-->[ten].


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
adverb(adv(too))-->[too].
adverb(adv(only))-->[only].
adverb(adv(there))-->[there].
adverb(adv(most))-->[most].
adverb(adv(more))-->[mpre].
adverb(adv(really))-->[really].

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
preposition(prep(to))-->[to].

%Determiner
det(d(this))-->[this].
det(d(that))-->[that].
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
conjunction(conj(where))-->[where].

%Pronouns
pronoun(pron(he))-->[he].
pronoun(pron(she))-->[she].
pronoun(pron(it))-->[it].
pronoun(pron(me))-->[me].
pronoun(pron(i))-->[i].
pronoun(pron(us))-->[us].
pronoun(pron(we))-->[we].

interPronoun(pron(who))-->[who].
interPronoun(pron(what))-->[what].
interPronoun(pron(which))-->[which].
interPronoun(pron(whose))-->[whose].
interPronoun(pron(whom))-->[whom].

%Punctuation
punctuation(punc('.'))-->['.'].
punctuation(punc('?'))-->['?'].
punctuation(punc('!'))-->['!'].