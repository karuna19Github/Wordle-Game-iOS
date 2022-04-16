# Wordle-Game-iOS

https://github.com/karuna19Github/Wordle-Game-iOS


Wordle is the second game that I made using SwiftUI. The game theme is animal , in this game player can choose how many letters word and what level they want to play ,the words between four, five or six letters word and three level (Hard ,Medium ,Easy) . 



https://user-images.githubusercontent.com/102145197/163688492-ee22d707-5b45-427e-860e-9bc9edce1b23.mov


Plz button is a hint function, will fill in the corresponding position in the correct answer in the current grid number (ex: press Plz after filling in CA, if the answer is BEAVER, it will be in the third grid Fill in A, the original column will become CAA[][][]).
Home button is a back function to previous page.


https://user-images.githubusercontent.com/102145197/163688409-347617f4-3e89-4e92-ab2b-f9222008870b.mov



When the player enters Enter if the number of characters filled in is insufficient, an Alert will pop up to warn the player that the number of characters is insufficient. And if any letter of the word filled in by the player does not exist in the correct answer, the Alert of No word in List will pop up to tell the playe .After sending Enter, the column will determine whether the answer is correct Letters that exist
 but are in the wrong place -> yellow
Exactly -> green
completely absent -> gray

https://user-images.githubusercontent.com/102145197/163688722-1c8c95ab-083c-48b1-bc27-5b462424c09b.mov




If there is a correct answer, it will jump to the next page to display You Win!!
If the answer is not answered at the end, it will jump to the next page to display You Suck
Clicking show result on the page after the jump will display the result of the game just played. Click back to jump back to the game screen

https://user-images.githubusercontent.com/102145197/163688559-fd8b563f-098c-49e8-9c47-0a62f9f0c753.mov


