Oh... Hello stranger #portrait: joe-neutral #layout: right #voice: talk-J

+ [Are you talking to me?]
    Yes, I am. You are the only person here#portrait: joe-happy
    + + [Hello]
        -> introductions
    + + [Hello, I am Milo]
        Hi Milo, I am Joe. Welcome to Drybend.#speaker: Joe #portrait: joe-happy
        -> intown
+ [Hello]
    -> introductions
+ [Oh... Uh... Hello]
    -> introductions    
    
=== introductions ===
I am Joe, what is your name?#speaker: Joe #portrait: joe-happy
+ [I am Milo.]
    Good to meet you Milo. Welcome to Drybend.#portrait: joe-happy
    -> intown
+ [My name is Milo, what is yours?]
    I just told my name, silly.#portrait: joe-laughing
    -> intown
+ [Non of your concern.]
    Wow.. you are a tough one. #portrait: joe-angry
    ->rude
-> END

=== intown ===
So, what brings you to Drybend?
+ [I am travelling and stopping at each town on the road]
    Oh.. that's cool. Where are you planning to go?#portrait: joe-intrigued
    + + [South.]
        That's vague.#portait: joe-neutral
        -> vagueresp
    + + [To Millport.]
        -> tomillport
    + + [To the end of the road.]
        -> seriouslyresp
    + + [Non of your bussiness, Joe.]
        How rude of you.#portrait: joe-angry
        ->rude
+ [It's not of your concern.]
   Well that's rude.
   -> rude
+ [I needed a rest from travelling.]
    That's nice.#portrait: joe-neutral
    -> welcometostay
-> END

=== vagueresp ===
+ [I know]
  Well... anyway.#portrait: joe-sad
  ->nicetalk
+ [Good]
  Well... anyway.#portrait: joe-
  ->nicetalk
-> END

=== welcometostay ===
You can rest in Drybend for sometime.#portrait: joe-happy
+ [Thank you for that offer.]
    Fantastic. Enjoy your stay.#portrait: joe-laughing
    -> nicetalk
+ [Good, I was planning to.]
    Great. Enjoy your stay.#portrait: joe-happy
    -> nicetalk
+ [I might leave soon.]
   Oh.. what a shame. #portrait: joe-neutral
    -> nicetalk
-> END

=== tomillport ===
It's a wonderfull city. I'm planning to got there next week #portrait: joe-happy
+ [That's great, maybe we can meet?]
    YES! That would be amazing. #portrait: joe-laughing
    -> seeyouthere
+ [That sounds like fun.]
    I sure hope so. #portrait: joe-happy
   -> nicetalk
+ [I don't care]
    -> rude
-> END

=== seriouslyresp ===
WOW, Seriously? thats 200 miles!#portrait: joe-laughing
+ [Oh, yes it is.]
    That will take at least a fortnight to walk there.
    -> moreseriousresp
+ [It's possible]
    -> moreseriousresp
+ [I am aware of that]
    You are resiliant and confidant.#portrait: joe-happy
    Good luck. You can stay here for sometime.
    -> nicetalk
-> END

=== moreseriousresp ===
Are you actually planning to walk that far?#portrait: joe-intrigued
+ [Yes]
    Damn, I admire you.#portrait: joe-happy
    Good Luck.
    -> nicetalk
+ [I am not sure]
    You can stay here for a while and think over it.#portrait: joe-neutral
    + + [Gladly]
        Great.#portrait: joe-happy
        -> nicetalk
    + + [OK]
        Good.#portrait: joe-happy
        -> nicetalk
    + + [No, thanks]
        That's Okay.#portrait: joe-neutral
        -> nicetalk
+ [Like you care]
    You don't need to be rude.#portrait: joe-sad
    -> rude
-> END
//endings
=== nicetalk ===
It was nice talking to you.#portrait: joe-happy
-> END

=== seeyouthere ===
See you there,, Milo. And take care.#portrait: joe-happy
-> END

=== rude ===
You are a rude person.#portrait: joe-angry
Bye.#portrait: joe-angry
-> END