suppressPackageStartupMessages(library(proceduralnames))
suppressPackageStartupMessages(library(here))
suppressPackageStartupMessages(library(magick))
suppressMessages(message("ABC"))

word <- make_english_names(1,1)
word_split<- unlist(strsplit(word,""))

snowman1 <- image_read("SnowmanPictures/Snowman1.png")
snowman2 <- image_read("SnowmanPictures/Snowman2.png")
snowman3 <- image_read("SnowmanPictures/Snowman3.png")
snowman4 <- image_read("SnowmanPictures/Snowman4.png")
snowman5 <- image_read("SnowmanPictures/Snowman5.png")
snowman6 <- image_read("SnowmanPictures/Snowman6.png")
snowman7 <- image_read("SnowmanPictures/Snowman7.png")
snowman8 <- image_read("SnowmanPictures/Snowman8.png")
snowman9 <- image_read("SnowmanPictures/Snowman9.png")
snowman10 <- image_read("SnowmanPictures/Snowman10.png")

checker <- function(letters, guess){
  match <- NA
  if (guess%in%word_split){
    match = TRUE
  } else{
    match = FALSE
  }
  return(match) 
}

snowman_selector <- function(guesses){
  if(guesses == 0) {
    plot(snowman1)
  }else if (guesses == 1){
    plot (snowman2)
  }else if (guesses == 2){
    plot (snowman3)
  }else if (guesses == 3){
    plot (snowman4)
  }else if (guesses == 4){
    plot (snowman5)
  }else if (guesses == 4){
    plot (snowman6)
  }else if (guesses == 6){
    plot (snowman7)
  }else if (guesses == 7){
    plot (snowman8)
  }else if (guesses == 8){
    plot (snowman9)
  }else if (guesses == 9){
    plot (snowman10)
  }
}

incorrect_guesses <- 0
correct_guesses <- 0
correctly_guessed_letters <- character(0)
plot(snowman1)
print("Welcome to the Snowman Game! Its up to you to correctly guess the secret word and save the snowman from a watery end!")
print("Lets begin!")
while ((correct_guesses < length(word_split)) & (incorrect_guesses < 9)) {
  guess <- readline("Enter your guess: ")
  match <- checker(word_split, guess)
      if (match==FALSE){
        print("incorrect") 
        incorrect_guesses <- incorrect_guesses + 1
        snowman_selector(incorrect_guesses)
    } else {
        print("correct")
        correct_guesses <- correct_guesses + 1
        correctly_guessed_letters <- append(correctly_guessed_letters, guess)
  } 
 }
 if (correct_guesses == length(word_split)){
   print("Congradulations! You've saved the snowman!")
 } else if (incorrect_guesses == 9) {
   print ("Oh No! You've melted the snowman!")
 }
 

