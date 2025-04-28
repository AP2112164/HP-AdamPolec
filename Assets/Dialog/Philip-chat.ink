Ugh... Hello  #portrait: phillip-angry #layout: right #voice: talk-P
+ [Hello]
    What do you want? #portrait: phillip-angry
    -> introdcing
+ [Uh... Hello]
    Ugh... What is it stranger?#portrait: phillip-angry
    -> introdcing
+ [Are you alright?]
    DO I LOOK ALRIGHT?#portrait: phillip-furious
    -> whylikethis
-> END

=== introdcing ===
+ [I am Milo, What is your name?]
    I am Phillip. Nice to meet you.#speaker: Phillip #portrait: phillip-neutral
    ->howareyou
+ [Nice to meet you]
    Ugh.. Hi...#portrait: phillip-angry
    -> whylikethis
+ [Nevermind]
  Good, I dont want to talk to you.#portrait: phillip-sad
  ->whynottalk
-> END

=== howareyou ===
+[How are you?]
  Not good#portrait: phillip-sad
  ->whynotgood
+[Are you doing OK?]
  No, I am not#portrait: phillip-angry
  ->whynotgood
+[Why are you angry?]
  Im angry because I am old and have to use this walker!#portrait: phillip-furious
  ->walker
->END

 === whynotgood ===  
 +[Why is that?]
  Because I have to use a walker.#portrait: phillip-angry
  ->walker
 +[How come?]
 Because I have to use a walker.#portrait: phillip-angry
 ->walker
 ->END
 
=== whylikethis ===
+ [Why are you like this?]
    You mean angry?
    ++[Yes]
      It's because I can't go anywhere with this stupid walker#portrait: phillip-furious
      ->walker
    ++[Of course]
      It's because I can't go anywhere with this stupid walker#portrait: phillip-furious
      ->walker
    ++[No, joyful]
      What are you talking about? I am angry#portrait: phillip-angry
      ->whyangry
+ [What is wrong with you?]
    Nothing. I am just angry.#portrait: phillip-angry
    ->whyangry
+ [Are you angry?]
    Yes, I am.#portrait: phillip-angry
    ->whyangry

=== walker ===
+[When did you get this walker?]
 Two years ago, after I broke my leg.#portrait: phillip-sad
 ->thatsbad
+[How long do you have this?]
 Only for two years, but it feels like longer.#portrait: phillip-sad
 ->thatsbad
->END

=== thatsbad ===
+[That is rough]
  Yes, it was a very nasty injury.#portrait: phillip-neutral
  ->walkingstick
+[That is a long time]
  It very much is#portrait: phillip-neutral
  ->walkingstick
+[Has your leg healed?]
  Yes, thankfully it has.#portrait: phillip-happy
  ->walkingstick
  ->END

=== whynottalk ===
+[Why do you not want to talk to me?]
 Im busy, trying to walk somewhere#portrait-phillip-angry
 ++[Do you need help?]
    No, thank you.#portrait: phillip-neutral
    I can manange with this stupid walker#portrait: phillip-angry
    ->walker
 ++[Okay]
    Good. Now go away.#portrait: phillip-angry
    ->later
 ++[Have fun walking]
    HAHA... not funny.#portrait: phillip-angry
    Goodbye.
    ->later
+[But why?]
 I'm walking to help Joe with some stuff.#portrait: phillip-neutral
 I don't have time for talking with people, especially with strangers#portrait: phillip-angry
 ++[I want to talk you]
    Ok... let's talk#portrait: phillip-sad
    ->introdcing
 ++[Oh, Okay. Bye]
    Goodbye #portrait: phillip-neutral
    ->later
->END

=== walkingstick ===
But I still need the walker to move around#portrait: phillip-neutral
+[That sucks]
 Yes, it does#portrait: phillip-sad
 ->helpoptions
+[Have you considered getting a walking stick?]
 No, I have not.#portrait: phillip-sad
 ->considerastick
+[Do you have anything else that will help you walk?]
 Sadly, I do not#portrait: phillip-sad
 ->helpoptions
-> END

=== helpoptions === 
Would you offer anything to help me walk?#portrait: phillip-nsus
+[A wheelchair]
 That would be a good option#portrait: phillip-neutral
 Infact, it would be perfect#portrait: phillip-happy
 I will get myself a wheelchair.#portrait: phillip-laughing
 ->thanksMilo
+[A walking stick]
 Hmmm... That would be perfect..#portrait: phillip-happy
 I will get myself a walking stick.#portrait: phillip-laughing
 ->thanksMilo
+[A new set of legs]
 HAHA... NO!!!##portrait: phillip-furious
 ->helpoptions
+[A jetpack]
 HAHAHA... If they only existed!!#portrait: phillip-laughing
 But let's be serious...#portrait: phillip-neutral
 ->helpoptions
->END

=== considerastick === 
 +[You should get one]
  That is a great idea #portrait: phillip-happy
  Why didn't I think of this before?#portrait: phillip-laughing
  I will get myself a walking stick#partrait: phillip-happy
  ->thanksMilo
 +[It will help you]
  That is a great idea.#portrait: phillip-happy
  I will get myself a walking stick.#portrait: phillip-happy
  ->thanksMilo
 +[Then get one, gramps]
  HAHAHA ... Very funny.#portrait: phillip-furious
  I was beginning to like you.#portrait: phillip-angry
  ->getaway
->END

=== whyangry ===
+[Why are you this angry?]
 Because I have to use this walker#portrait: phillip-furious
 ->walker
+[How long have you been angry?]
 Ever since I got this walker.#portrait: phillip-angry
 I have to use this to help walk through the town.#portrait: phillip-sad
 And I hate it.#portrait: phillip-angry
 ->walker
+[I did not notice]
 ARE YOU BLIND, I HAVE TO USE THIS WALKER!!!#portrait: phillip-furious
 ->walker
->END

=== thanksMilo ===
 Thank You for your help, Milo
 +[Happy to help]
  You are a gem.#portrait: phillip-happy
  ->goodbye
 +[No problem]
  You are an amazing young man.#portrait: phillip-happy
  ->goodbye
->END

=== goodbye ===
See you around.#portrait: phillip-laughing
->END

=== getaway ===
GO AWAY#portrait: phillip-furious
-> END

=== later ===
Later, kiddo #portrait: phillip-angry
->END