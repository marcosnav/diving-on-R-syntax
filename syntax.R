x <- 90
y <- 30

print(class(x))       # numeric
print(class(4L))      # integer
print(class(TRUE))    # logical
print(class(T))       # logical
print(class(1 + 4i))              # complex
print(class("text Sample"))       # character
print(class(charToRaw(("blah")))) # raw

# is.integer(x)
# is.numeric(y)
# ...

# as.integer(x)

sprintf("x + y gives us: %d", x + y)    # "x + y gives us: 120"
sprintf("y / x gives us: %1.5f", y / x) # "y / x gives us: 0.33333"


# VECTORS -------------------------------------
numbers <- c(3, 2, 0, 5, 8)
numbers           # 3 2 0 5 8
numbers[1]        # 3 (in R, index start at 1)
length(numbers)   # 5
numbers[-1]       # 2 0 5 8
numbers[-3]       # 3 2 5 8
numbers[c(1, 4)]  # 3 5
numbers[2:4]      # 2 0 5
numbers[1] <- 9
numbers           # 9 2 0 5 8

sort(numbers)                     # 0 2 5 8 9
sort(numbers, decreasing = TRUE)  # 9 8 5 2 0

one_to_ten <- 1:10
one_to_ten
one_to_ten[3] # 3

seq_by_three <- seq(from = 3, to = 27, by = 3)
seq_by_three  # 3 6 9 12 15 18 21 24 27

seq_by_four <- seq(from = 4, by = 4, length.out = 5)
seq_by_four  # 4 8 12 16 20

sprintf("12 in sequence: %s", 12 %in% seq_by_four) # 12 in sequence: TRUE

rep(x = 2, times = 3, each = 3)           # 2 2 2 2 2 2 2 2 2
rep(x = c(5, 7, 9), times = 2, each = 2)  # 5 5 7 7 9 9 5 5 7 7 9 9

one_to_twenty <- 1:20
is_even <- one_to_twenty %% 2 == 0
is_even     # FALSE TRUE FALSE TRUE FALSE ... TRUE FALSE TRUE (for each value)

just_evens <- one_to_twenty[one_to_twenty %% 2 == 0]
just_evens  # 2  4  6  8 10 12 14 16 18 20

one_to_twenty[c(T, F, F, T, F)] # 1  4  6  9 11 14 16 19


# IF ... ELSE ... SWITCH -------------------------------------
a <- 10

if (a > 5) {
  print("greater than 5")
} else if (a < 3) {
  print("a small number")
} else {
  print("meh")
}

scream <- function() {
  print("WATCH OUT!!!")
}

say_hi <- function() {
  print("what up?")
}

ignore <- function() {
  print("...")
}

situation <- "danger"

switch(
  situation,
  "danger"  = scream(),
  "focus"   = ignore(),
  say_hi()
)           # WATCH OUT!!!


# STRINGS -------------------------------------
my_favorite_string <- "food"
nchar(my_favorite_string) # 4

sprintf("meat > fruits %s", "meat" > "fruits")        # meat > fruits TRUE
sprintf("meat > zfruit %s", "meat" > "zfruit")        # meat > zfruit FALSE
sprintf("meat < mermelade %s", "meat" < "mermelade")  # meat < mermelade TRUE

paste("Owl", "Bear", sep = " is food for ")           # "Owl is food for Bear"
substr("Hello Sheep and Cow", start = 1, stop = 11)   # "Hello Sheep"

sub("Hello Sheep, Cow and Cow", pattern = "Cow", replacement = "Chicken")  # "Hello Sheep, Chicken and Cow"
gsub("Hello Sheep, Cow and Cow", pattern = "Cow", replacement = "Chicken")  # "Hello Sheep, Chicken and Chicken"

string_vector <- strsplit("A dog ran fast", " ")
string_vector # "A"    "dog"  "ran"  "fast"


# FACTORS -------------------------------------
direction <- c("Up", "Left", "Right", "Down", "Left", "Up")
factor_direction <- factor(direction)
is.factor(factor_direction) # TRUE
factor_direction            # Levels: Down Left Right Up
levels(factor_direction)    # "Down"  "Left"  "Right" "Up"

days <- c("Monday", "Tuesday", "Wednesday", "Thursday",
          "Friday", "Saturday", "Sunday")

work_days <- c("Tuesday", "Thursday", "Monday")
work_days_fact <- factor(work_days, levels = days, ordered = TRUE)
work_days_fact  # [1] Tuesday  Thursday Monday  
                # 7 Levels: Monday < Tuesday < Wednesday < Thursday ... < Sunday


# DATA FRAMES -------------------------------------
customer_data <- data.frame(
                  name  = c("Tom", "Sally", "Sue"),
                  age   = c(43, 26, 32),
                  job   = c("chef", "astronaut", "painter"),
                  stringsAsFactors = FALSE
                )

customer_data           # Is the full table
#     name  age       job
# 1    Tom   43      chef
# 2  Sally   26 astronaut
# 3    Sue   32   painter

customer_data[1, 1]     # "Tom" (row 1, col 1)
customer_data[1, 2]     # 43    (row 1, col 2)
customer_data[1, 1:3]   # "Tom" 43 "chef" (row 1, col values 1 to 3)
customer_data[1:3, 2]   # 43 26 32 (all ages, 2nd col)
dim(customer_data)      # 3 4 (3 by 4, 3 rows with 4 cols)

mark_record <- data.frame(
                name  = "Mark",
                age   = 35,
                job   = "professional puzzle architect"
              )
customer_data <- rbind(customer_data, mark_record) # record bind
customer_data
#     name  age                           job
# 1    Tom   43                          chef
# 2  Sally   26                     astronaut
# 3    Sue   32                       painter
# 4   Mark   35 professional puzzle architect

debt <- c(24.3, 0, 5.3, 89.74)
customer_data <- cbind(customer_data, debt) # column bind
customer_data
#     name  age                           job  debt
# 1    Tom   43                          chef 24.30
# 2  Sally   26                     astronaut  0.00
# 3    Sue   32                       painter  5.30
# 4   Mark   35 professional puzzle architect 89.74

# For records that have debt, get all cols info
owes_money <- customer_data[customer_data$debt > 0, ]
owes_money
#   name age                           job  debt
# 1  Tom  43                          chef 24.30
# 3  Sue  32                       painter  5.30
# 4 Mark  35 professional puzzle architect 89.74

# Sum all debt
sum(owes_money$debt) # 119.34

# For records that have debt, get only first col "name"
owes_money <- customer_data[customer_data$debt > 0, 1]
owes_money # "Tom"  "Sue"  "Mark"


# LOOPING -------------------------------------
count <- 1
repeat {
  print(count)
  count <- count + 1
  if (count > 5) {
    break
  }
}

while (count > 0) {
  count <- count - 1
  if (count %% 2 == 0) {
    next
  }
  print("is odd")
}

for (i in 1:5) {
  print(i)
}


# MATRIX -------------------------------------
mtx_data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
mtx_one <- matrix(mtx_data, nrow = 3, ncol = 3)
mtx_one
#      [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9

mtx_two <- matrix(mtx_data, nrow = 3, ncol = 3, byrow = TRUE)
mtx_two
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
# [3,]    7    8    9

dim(mtx_two)  # 3 3
mtx_two[1, 2] # 2 (1st row, 2nd col)
mtx_two[3, 2] # 8 (3rd row, 2nd col)
mtx_two[3, ]  # 7 8 9 (all 3rd row)
mtx_two[, 2]  # 2 5 8 (all 2nd col)

mtx_three <- rbind(1:3, 8:10, 4:6)
mtx_three
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    8    9   10
# [3,]    4    5    6

mtx_three[2:3, ] # 2nd and 3rd row
#      [,1] [,2] [,3]
# [1,]    8    9   10
# [2,]    4    5    6

mtx_four <- rbind(1:5, 4:9, 13:18)
mtx_four
#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    2    3    4    5    1
# [2,]    4    5    6    7    8    9
# [3,]   13   14   15   16   17   18

mtx_four[2, 3] <- 100 # Change a value
mtx_four
#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    2    3    4    5    1
# [2,]    4    5  100    7    8    9
# [3,]   13   14   15   16   17   18

mtx_four[2, ] <- 210:215 # Change the whole 2nd row
mtx_four
#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    2    3    4    5    1
# [2,]  210  211  212  213  214  215
# [3,]   13   14   15   16   17   18

mtx_four[, 4] <- 401:403 # Change the whole 4th column
mtx_four
#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    2    3  401    5    1
# [2,]  210  211  212  402  214  215
# [3,]   13   14   15  403   17   18


# MULTI DIMENSIONAL ARRAY -------------------------------------
arr_one <- array(1:8, dim = c(2, 2, 2))
arr_one
# , , 1
#      [,1] [,2]
# [1,]    1    3
# [2,]    2    4

# , , 2
#      [,1] [,2]
# [1,]    5    7
# [2,]    6    8

arr_one[1, 2, 2] # 7


# FUNCTIONS -------------------------------------
last_expression_is_returned <- function(a, b) {
  a + b
}
last_statement_is_returned(5, 10) # 15

products <- list(
  list(name = "pizza oven", coupon = FALSE, price = 1000),
  list(name = "broken drill", coupon = TRUE, price = 2.50),
  list(name = "expensive but ugly sweater", coupon = TRUE, price = 5000)
)

apply_discount <- function(product) {
  # missing() test whether a value was specified as an argument to a function.
  if (missing(product)) {
    # stop() stops execution and executes an error action.
    stop("Missing product arg")
  }
  if (product$coupon) {
    return(product$price * 0.7)
  }
  product$price
}

apply_discount(products[[1]]) # 1000
apply_discount(products[[2]]) # 1.75
apply_discount(products[[3]]) # 3500

tryCatch({            # Handling errors
    apply_discount()  # "Missing product arg"
  },
  error = function(e) {
    # geterrmessage() gives the last error message.
    # ERROR: apply_discount() failed due to: Missing product arg
    sprintf("ERROR: apply_discount() failed due to: %s", geterrmessage())
  }
)

# Spread params
go_hunt <- function(...) {
  target_list <- list(...)
  for (tgt in target_list) {
    msg <- sprintf("Lets hunt %s", tgt)
    print(msg)
  }
}

go_hunt("duck", "deer", "wild hog")
# [1] "Lets hunt duck"
# [1] "Lets hunt deer"
# [1] "Lets hunt wild hog"


# ANONYMOUS FUNCTIONS -------------------------------------
participants <- list("John", "Jane", "Lou", "Carl", "Jin Sakai")
greetings <- (function(p) sprintf("Hello, %s", p))(participants)
for (g in greetings) {
  print(g)
}
# [1] "Hello, John"
# [1] "Hello, Jane"
# [1] "Hello, Lou"
# [1] "Hello, Carl"
# [1] "Hello, Jin Sakai"


# READING FILES -------------------------------------
browsers <- read.table(
              file = "./browsers.txt",
              header = TRUE, sep = " ",
              na.strings = "`",
              stringsAsFactors = FALSE
            )

browsers
#     rank            name   usage
# 1      1          Chrome   66.12
# 2      2          Safari   17.24
# 3      3         Firefox    3.98
# 4      4 SamsungInternet    3.18
# 5      5            Edge    2.85
# 6      6           Opera    2.08
# 7      7           Brave      NA

for (i in 1:5) {
  b_row <- browsers[i, ]
  msg <- sprintf("%s's usage is %s percent", b_row$name, b_row$usage)
  print(msg)
}
# [1] "Chrome's usage is 66.12 percent"
# [1] "Safari's usage is 17.24 percent"
# [1] "Firefox's usage is 3.98 percent"
# [1] "SamsungInternet's usage is 3.18 percent"
# [1] "Edge's usage is 2.85 percent"

new_browser <- data.frame(rank = 8, name = "DancingPeanut", usage = 0.12)
new_browser

browsers <- rbind(browsers, new_browser)
browsers

sum(browsers[, 3], na.rm = TRUE)  # 95.57
sum(browsers$usage, na.rm = TRUE)  # 95.57

tail(browsers, n = 3)
#   rank          name usage
# 6    6         Opera  2.08
# 7    7         Brave    NA
# 8    8 DancingPeanut  0.12

plot(
  x = browsers$usage,
  y = browsers$rank,
  xlab = "Usage",
  ylab = "Rank",
  type = "b"
)
