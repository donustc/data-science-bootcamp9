game01 <- function() {
  username <- readline("Hi what's your name: ")
  paste("Welcome to the Rock Paper Scissor  game ", username)
  hands <- c("rock","paper","scissor")
  com_hand <- sample(hands,1)
  player_hand <- tolower(readline("Choose Rock,Paper or Scissor: "))
  print(paste("Com hand: ",toupper(com_hand)))
  if (com_hand == "rock" & player_hand == "rock") {
  print("Draw!")
  }else if (com_hand == "rock" & player_hand == "paper") {
      print("Win!")
  }else if (com_hand == "rock" & player_hand == "scissor") {
      print("Lose!")
  }else if (com_hand == "paper" & player_hand == "rock") {
      print("Lose!")
  }else if (com_hand == "paper" & player_hand == "paper") {
      print("Draw!")
  }else if (com_hand == "paper" & player_hand == "scissor") {
      print("Win!")
  }else if (com_hand == "scissor" & player_hand == "rock") {
      print("Win!")
  }else if (com_hand == "scissor" & player_hand == "paper") {
      print("Lose")
  }else if (com_hand == "scissor" & player_hand == "scissor") {
      print("Draw!")
  } else print("Error! Try again")
  }
