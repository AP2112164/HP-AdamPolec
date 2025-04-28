Hello there, young man #portrait: velma-neutral #layout: right #voice: talk-V
->sayname

=== sayname ===
+[Hi, I am Milo]
  I am Velma#speaker: Velma #portrait: velma-happy
 ->nicetown
+[Hi, who are you?]
 I'm Velma, and you are?#speaker: Velma #portrait: velma-happy
 ++[I am Milo]
    ->nicetown
 ++[Why do you care?]
    That's a little rude.
    -> quiterude
+[Uh... hi]
 You are a little shy#portrait: velma-happy
 ++[My name is Milo]
   And my name is Velma#speaker: Velma #portrait: velma-happy
   ->nicetown
 ++[I am sorry]
   That's OK.#speaker: Velma #portrait: velma-happy
   ->sayname
->END

=== nicetown ===
Nice to meet you, Milo#portrait: velma-happy
+[Why do you live here?]
 Because it's beatifull all year round. And I was born here#portrait: velma-laughing
 ->townquestions
+[This is a nice town]
 It's always nice, all year round.#portrait: velma-happy
 ->townquestions
+[This town is awful]
 Oh SHUT UP... You are just a tourist#portrait: velma-angry
 ->alwayrude
->END

=== townquestions ===
+[Wow, that is interesting]
 The summer is wonderfull.#portrait: velma-happy
 ->mightreturn
+[Do you ever want to leave?]
 Sometimes... I think about it.#portrait: velma-neutral
 But I don't like change and new enviroments that much#portrait: velma-neutral
 -> dontlikechange
+[Shame, Im only planning to rest here.]
 That's a shame.#portrait: velma-neutral
 ->staylonger
+[I don't care]
 That's is rude of you#portrait: velma-angry
 ->alwayrude
-> END

=== dontlikechange ===
+[Why is that?]
 I like how things are stable these days.#portrait: velma-happy
 And its a peacefull place to live in.
 ++[I can see that]
    Yeah.. its perfect#portrait: velma-happy
    ->seeyoulater
 ++[I can't say that is true]
    Well... you just have to spend more time here#portrait: velma-happy
    ->seeyoulater
+[I understand what you mean]
 Oh Good, at least someone does.#portrait: velma-laughing
 Anyway..
 ->seeyoulater
+[You are a little weird]
 That is a little rude of you#portrait: velma-angry
 -> alwayrude
->END

=== mightreturn ===
You should come back her in 2 months and see for yourself.#portrait: velma-happy
 +[I might come back]
    That's fantastic!#portrait: velma-laughing
    I will see you in 2 months.#portrait: velma-happy
    ->seeyoulater
 +[I think I will]
    Great! See you then.#portrait: velma-happy
    ->seeyoulater
 +[Not planning to]
    That's a shame#portrait: velma-sad
    ->seeyoulater
->END

=== quiterude ===
+[I am sorry. My name is Milo]
 ->nicetown
+[Yes, it is]
 ->alwayrude
->END

=== staylonger ===
You can always stay a little longer#portrait: velma-happy
+[I will think about it]
 Alright, take your time.#portrait: velma-neutral
 ++[I think I will.]
    Great!#portrait: velma-happy
    ->haveagoodstay
 ++[Sorry, I can't stay here.]
    Well.. that's a shame.#portrait: velma-neutral
    ->seeyouaround
+[Sure, Why not]
 That's awesome.#portrait: velma-happy
 ->haveagoodstay
+[No, sorry]
 Oh... that's OK#portrait: velma-sad
 ->seeyouaround
->END

=== alwayrude ===
Are you always this rude?#portrait: velma-angry
+[Yes, I am]
 Are you aware that when you are rude, you hurt people's feelings?#portrait: velma-nsus
    ++[Yes]
    ->benice
    ++[No]
    ->explainationofrudeness
+[Sometimes]
 You know that what you say, can hurt people's feelings?#portrait: velma-nsus
    ++[I know]
     ->benice
    ++[I am aware of that]
    ->explainationofrudeness
+[Never]
 Well, when you do, you can hurt people's feelings?#portrait: velma-neutral
 Did you know that already?#portrait: velma-nsus
    ++[Yes]
    ->benice
    ++[No, I didn't]
    ->explainationofrudeness
-> END

=== explainationofrudeness ===
Well, that can happen sometimes.#portrait: velma-neutral
People will stop talking to you beacuse they will think you are rude.#portrait: velma-neutral
So when you meet new people, try to be friendly not rude as you were just now.#portrait: velma-nsus
Do you understand that?#portrait: velma-nsus
+[Yes]
 Great.#portrait: velma-happy
 Let's start fresh.#portrait: velma-happy
 ->nicetown
+[I understand]
 Good!#portrait: velma-happy
 Let's start fresh.#portrait: velma-happy
 ->nicetown
+[No]
 OMG... Just go away!#portrait: velma-angry
 ->getlost
->END

=== benice ===
Good. Next time try to be nice when you meet new people.#portrait: velma-neutral
Do you understand that?#portrait: velma-nsus
+[I understand]
 That's great.#portrait: velma-happy
 Let's start fresh.#portrait: velma-happy
 ->nicetown
+[No]
 Oh my... you are just stubborn or dumb.#portrait: velma-angry
 ->getlost
->END

=== seeyoulater ===
See you later #portrait: velma-laughing
-> END

=== haveagoodstay ===
I hope you will enjoy your stay.#portrait: velma-laughing
->END

=== seeyouaround ===
See you around then, Milo#portrait: velma-neutral
-> END

=== getlost ===
Goodbye. #portrait: velma-angry
->END