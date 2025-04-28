 H-Hi th-there ...  #portrait: elliot-sadbawl #layout: right #voice: talk-E
-> introtoEl

=== introtoEl ===
+ [Hello, My name is Milo]
    Hi Milo, I.. am Elliot. #portrait: elliot-sadcry #speaker: Elliot
    -> main 
+ [What is happening on your face?]
    I-I am... c-cry-crying #portrait: elliot-sadcry
    -> main
+ [Are you... crying?]
    Y-Yeah ... #portrait: elliot-sadcry
    -> main
->END

=== main ===
 + [Why are you crying?]
   I am crying ... because... Toffe... Toffe died.#portrait: elliot-sadcry
    + + [Toffe?]
        Toffe... she is... was my cat ... she died yesterday#portrait: elliot-sadcry
        -> deadCat
    + + [Who is Toffe?]
        Toffe was my cat... she is dead.#portrait: elliot-sadcry
        -> deadCat
    + + [I'm sorry for your loss]
        M-hm#portrait: elliot-sadcry
        -> deadCat
 + [Why are you... sad?]
    ->whysad
 + [Stop crying, it is very uncomfortable]
    I can't stop... Why would you say that?#portrait: elliot-sadbawl
    ->cruelending
-> END
 
=== whysad ===
I am sad... because... someone died#portrait: elliot-sadcry
+ [Did your Dad die?]
    No... it was my cat#portrait: elliot-sad
    -> deadCat
+ [Did your Mum die?]
    No... Not her... it was my cat#portrait: elliot-sad
    -> deadCat
+ [Did somebody else die?]
    My cat... Toffe, died#portrait: elliot-sadcry
    -> deadCat
-> END

=== deadCat ===
+ [Im really sorry that your cat died]
    It's going to be different without her #portrait: elliot-sad
    ->assuring
+ [That's sad. I have to go now, bye]
    OK...#portrait: elliot-sadcry
    ->sadgoodbye
+ [There is a way to keep her alive]
   ->keepToffee
  -> END
  
=== keepToffee ===
There is?#portrait: elliot-intrigued
+ [You can still speak about her, she will live on that way]
    Yeah... I can tell someone about her.#portrait: elliot-happy
    She was a great cat.#portrait : elliot-happy
    ->assuring
+ [Yes. When you are alone, think about her sometimes]
    ->bewithToffee
+ [No, there isn't. I was only joking]
    Why would you say that!? #portrait: elliot-sadbawl
    ->cruelending
->END

=== bewithToffee ===
So... that she could always be with me?#portrait: elliot-intrigued
+[Yes, exactly]
 Ok... I will think about her everyday then.#portrait: elliot-happy
 ->goodbye
+[No]
 Why would you say that?#portrait: elliot-sadbawl
 ->cruelending
-> END

=== assuring ===
+ [Death is a part of life]
    It is?#portrait: elliot-intrigued
    ++[Yes]
        I didn't know that#portrait: elliot-neutral
        ->everyonewilldie
    ++[It makes life worth living]
        I dont quite understand that#portrait: elliot-intriqued
        ->youwillknow
+ [Death happens to everyone]
    Really? #portrait: elliot-intrigued
    ->everyonewilldie
+ [Don't worry, Toffe will always be with you]
    She will... but how?#portrait: elliot-intrigued
    ->youwillknow
-> END

=== youwillknow ===
+[You are too young to understand]
    Oh..ok#portrait: elliot-neutral
    ->sadgoodbye
+[One day, when you are older, you will understand]
    Oh.. I just have to grow up and find out #portrait: elliot-happy
    ->goodbye
+[You never will]
    Ohh... that's a little sad#portrait: elliot-sad
    ->sadgoodbye
->END

=== everyonewilldie ===
So... Everyone will die?#portrait: elliot-intrigued
+[Sadly]
    Oh... That's sad#portrait: elliot-sad
    ->youwillknow
+[Yes]
    Ohh... But.... I don't understand#portrait: ellior-intrigued
    ->youwillknow
+[What did you think?]
    I never thought about it#portrait: elliot-neutral
    ->assuring
-> END

//endings
=== goodbye ===
Goodbye, Milo.#portrait: elliot-happy
-> END

=== sadgoodbye ===
Bye-bye, Milo.#portrait: elliot-sadcry
-> END

=== cruelending ===
You are a cruel man#portratit: elliot-sadcry
-> END