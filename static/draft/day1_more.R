
# | First steps
<hr>

You can assign values to new objects using the "left arrow" `<- `, more officially known as the _assignment operator_. Try adding the code below to your R script and creating an object called `droid`.

To run a line of code in your script, move the cursor to that line and press __CTRL+ENTER__.

```{r names, eval = F}
# Create a new object
droid <- "bb8"

droid

wookie <- "Chewbacca"

wookie


# To save text to a character object you need quotation marks: "text"
# Try this:
wookie <- Chewbacca


# Without quotes, R looks for an object called Chewbacca, and then lets you know that it couldn’t find one.
```


```{r names2, eval = F}
# To copy an object save it to a new name.
wookie2 <- wookie


# Or overwrite an object
wookie <- "Tarfful"

wookie


# Did this change the value stored in wookie2?
wookie2

```


<br>

  ### Drop and remove data {-}

  You can drop objects with the remove function `rm() `. Try it out on some of your wookies.

```{r, eval = F}

# Delete objects to clean-up your environment
rm(wookie)

rm(wookie2)


# How can we get the 'wookie' object back?
# Hint: The UP arrow is your friend.

```

<br>

  <details>
  <summary class = "btn_code_green"> **GOOD NEWS: ** Deleting data is okay </summary>
  <p>

  <div class="tip">
  Don’t worry about deleting data or objects, you can always recreate them! And when R loads data files it only copies the contents. All your original data files remain safe and won’t suffer from any accidental changes. If something disappears or goes wrong in R, it’s okay. You can always reload the data using your script.
</div>
  </p></details>


  ## Give it a name

  Everything has a name in R and you can name things almost anything you like. You can even name your data `TOP_SECRET_shhhhhh...` or `Luke_I_am_your_father` or `data_McData_face`.

Sadly, there are a _few_ minor restrictions. Names cannot include spaces or special characters that might be found in math equations, like `+`, `-`, `*`, `\`, `/`, `=`, `!`, or `)`.


### <i class="fa fa-astronaut" aria-hidden="true" style="color: green"></i> Exercise! {-}

Try running some of these examples in your R console. Find new ways to create errors. The more broken the more better!
  ```{r, eval = F}

n wookies <- 5

n*wookies <- 5

n_wookies <- 5

n.wookies <- 5


all_the_wookies! <- "Everyone on Kashyyyk"

```



```{r, eval = F}
# You can add one wookie
n_wookies <- n_wookies + 1


# But what if you have 10,000 wookies?
n_wookies <- 10,000


# They also cannot begin with a number.
1st_wookie <- "Chewbacca"

88b <- "droid"

# But they can contain numbers!
wookie1    <- "Chewbacca"

bb8 <- "droid"
```


<br>


  <details>
  <summary class = "btn_code_blue"> __EXPLORE:__ What happens when we create __n_wookies__ the second time? </summary>
  <p>

  > When we create a new object that has the same name as something that already exists, the new object replaces the old one. Sometimes we’ll want to update an existing object and replace the old version. Other times we may want to copy an object to a new name to preserve the original. This is similar to choosing between _Save_ and _Save As_ when we save a file.
>

  </p></details>

  ## Multiple items

  We can add multiple values inside `c()` to make a vector of items. It’s like a chain of items, where each additional item is connected by a comma. The `c` stands for to concatenate or to combine values into a vector.

Let’s use `c()` to create a few vectors of names.

```{r vectors}

# Create a character vector and name it starwars_names
starwars_names <- c("Luke", "Leia", "Han Solo")

# Print starwars_names to the console
starwars_names

# Create a numeric vector and name it starwars_ages
starwars_ages  <- c(19,18,25)

# Print the ages to the console
starwars_ages
```


## Make a table

A table in R is known as a __data frame__. We can think of it as a group of columns, where each column is made from a vector. Data frames in R have columns of data that are all the same length.

![](images/vector_to_dataframe.png){width="510" style="margin-left: 100px;"}

<br>


  Let’s make a data frame with two columns to hold the names and ages of our characters from above.
```{r table}

# Create table with columns "names" and "ages" with values from the starwars_names and starwars_ages vectors
starwars_df <- data.frame(names = starwars_names,
                          ages  = starwars_ages)

# Print the starwars_df data frame to the console
starwars_df

```


<br>

  ### {- .tabset}

  #### <i class="fa fa-astronaut" aria-hidden="true" style="color: green"></i> Exercise {-}
  <br>

  - Create the same table above with a 3rd column showing their father’s names: `c("Darth", "Darth", "Unknown")`

<br><br><hr>

  #### Show hint {-}
  <br>
  ```{r, eval = F}
starwars_df <- data.frame(names   = starwars_names,
                          ages    = starwars_ages,
                          fathers = _____________)
```
<br><br><hr>

  #### Show code {-}
  <br>
  ```{r, eval = F}
starwars_df <- data.frame(names   = starwars_names,
                          ages    = starwars_ages,
                          fathers = c("Darth","Darth", "Unknown"))
```
<br><br><hr>


  ### Get values from a `$column_name`  {-}

  Use the `$` sign after the name of your table to see the values in one of your columns.

```{r columns}

# View the "ages" column in starwars_df
starwars_df$ages

```


<div class="quiz">
  ### Pop Quiz, hotshot! {-}

  __Which of these names are valid for a new object?__ _(Hint: You can test them.)_

<input type="radio"> _my starwars fandom_  <br>
  <input type="radio"> _my_wookies55_        <br>
  <input type="radio"> _5wookies_            <br>
  <input type="radio"> _my-wookie_           <br>
  <input type="radio"> _Wookies!!!_          <br>

  <br>

  <details>
  <summary class = "btn_code">_Show solution_</summary>
  <p>

  <i class="fa fa-check" aria-hidden="true" style="color: green;"></i> `my_wookies55`

_Yes!! The FORCE is strong with you!_

</p>
  </details>
  </div>


  ## Leave a `#comment`

  The text in the scripts with the `#` in front are called comments. A line that starts with a `#` is ignored and won’t be run as R code. You can use the `#` to add notes in your script to make it easier for others and yourself to understand what is happening and why. You can also use comments to add warnings or instructions for others using your code.



## Functions

Now that you know what objects are and how to create them, let’s learn how to use them in functions. Functions take one or more inputs called "arguments". They perform steps based on the arguments and usually return an output object.

<br>

  <details>
  <summary class = "btn_code_blue">_Clone Trooper function_</summary>
  <p>

  You can think of a function like a plan for making Clone Troopers.

![](images/clonetrooper_fathead.png){width="220" style="float: left; margin-right: 36px; margin-top: -2px;"}

<br>

  ```{r, eval=F}

create_clones(host       = "Jango Fett",
              n_troopers = 2000)
```

<br><br>

  The function above creates Clone Troopers based on two arguments: the `host` and `n_troopers`. When we have more than one argument, we use a comma to separate them. With some luck, the function will successfully return a new object - a group of 2,000 Clone Troopers.

<br><br><br><br><br>

  <hr>

  </p></details>


  <br>

  ### The `sum()` function  {-}

  We already covered two functions: `c()` and `data.frame()`. Now let’s use the `sum()` function to find the sum age of our Star Wars characters.
```{r}

# Call the sum function with starwars_ages as input
ages_sum <- sum(starwars_ages) # Assigns the output to starwars_ages_sum

# Print the starwars_ages_sum value to the console
ages_sum

```

<br>

  The `sum()` function takes the _starwars_ages_ vector as input, performs some calculations, and returns a single numeric object. Note that we assigned the output object to the name `ages_sum`. If we don’t assign the output object it will be printed to the console and won’t be saved. Sometimes that’s what we want, especially when we’re exploring the data.

```{r}
# Alternative without assigning output
sum(starwars_ages)
```

<br>

  > __NOTE:__ The original `starwars_ages` vector hasn’t changed. Each function has its own "environment" and its calculations happen inside a bubble. In general, what happens inside a function won’t change your objects outside of the function.


```{r}
starwars_ages
```



## Function summary {-}

There are functions in R that are more complex but most boil down to the same general setup:

  ```{r, eval=F}
new_output <- function(argument_input1, argument_input2)
  ```

We call a function and then add input arguments inside the parentheses. In exchange, the function returns an output object. You can make your own functions in R and name them almost anything you like, even `my_amazing_starwars_function()`.

<br>

  <details>
  <summary class = "btn_code_blue"> __EXPLORE:__ What __arguments__ does my function have? </summary>
  <p>

  <div class="note">
  Functions often have more than one argument. Type `?read_csv` into your console to see help in the lower-right pane that describes all of the function’s arguments and what they do.

Many of the options have default arguments (such as `col_names = TRUE`) that the function uses if you don’t provide an alternative. A short scroll down in the help window will show you more details about the arguments and the values they take.

`function(arg1 = input1, arg2 = input2, arg3...)`

The _file_ argument tells us that the function expects a path to a file. It can be given many types of files, even a _ZIP_ file. Below that, you’ll see the _col_names_ argument. This argument takes either `TRUE`, `FALSE`, or a character vector of column names. The default is `TRUE`, which means the first row in the CSV will be used for the column names of your table.
</div>

  </p></details>


  <div class="quiz">
  ### Pop Quiz!   {-}

  __Which of these is a valid function call?__

<input type="radio"> _train("concentrate" "Force")_           <br>
  <input type="radio"> _shoot, "lightsaber", "Death Ray"_       <br>
  <input type="radio"> _replicate(100000000, "clones")_         <br>
  <input type="radio"> _fight(until   Empire    conquered)_     <br>
  <input type="radio"> _scrap(100 Datapads, "Hyperdrives")_     <br>

  <br>
  <details>
  <summary class = "btn_code">_Show solution_</summary>
  <p>
  <i class="fa fa-check" aria-hidden="true" style="color: green;"></i> `replicate(100000000, "clones")`

_Correct! You are ready to audit a Junk dealer._


</p></details></div>


  # | Read data
  <hr>

  The first step of a good scrap audit is reading/loading some data and figuring out where all the scrap is going. Here is a small dataset showing the scrap from Jakku. It was salvaged from a crash site and the transfer was incomplete.

```{r ex-data1, echo=F, message=F, warning=F}
library("readr")
library("tibble")
library("knitr")

options(scipen = 999)

scrap <- data.frame(source = c("Coruscant", "Tatooine", "Naboo", "Endor"),
                    destination = c("Jakuu", "Jakuu", "Jakuu", "Jakuu"),
                    item = c("hyperdrives", "datapads", "hyperdrives", "hyperdrives"),
                    quantity = c(3, 100, 45, 1),
                    price = c(300, 25, 45, 10000000))

kable(scrap)
```


## New Message _(1)_ {-}

<details>
  <summary class = "btn_code_green">_Incoming..._ _BB8_</summary>
  <p>

  <div class="tip">
  __BB8:__ _Beep boop Beep._

__BB8:__ _I intercepted a large scrapper data set from droid 4 of Junk Boss Plutt._

<br>

  Receiving data now...

<details>
  <summary class = "btn_code_green"> View data </summary><p>

  __scrap_records.csv__

```{r, eval=F}
Salvage,Origin,Dest,Amount,Units,Price_per_Ton
Flight recorder,Outskirts,Niima Outpost,887,Tons,590.93
Proximity sensor,Outskirts,Raiders,7081,Tons,1229.03
Aural sensor,Tuanul,Raiders,707,Tons,145.27
Electromagnetic filter,Tuanul,Niima Outpost,107,Tons,188.2
...
```

<br>

  __You:__ _This looks like a mess! What do I do with this BB8?_

</p></details></p></details>
  </tip>



  ## CSV to the rescue

  The main data format used in R is the __CSV__ _(comma-separated values)_. A __CSV__ is a simple text file that can be opened in R and most other stats software, including Excel. It looks squished together as plain text, but that’s okay! When opened in R, the text becomes a familiar looking table with columns and rows. But before we launch ahead, let’s add a _package_ to R that will help us read __CSV__ files.

<br>

  <details><summary class = "btn_code_blue"> How to save a CSV from Excel </summary>
  <p>

  __Step 1:__ Open your Excel file.

__Step 2:__

- Go to _File_
- _Save As_
- _Browse_ to your project folder
- Save as type: _CSV (Comma Delimited) (*.csv)_
- Any of the _CSV_ options will work
- Click __Yes__
- Close Excel (Click "Don’t Save" as much as you need to. Seriously, we just saved it. Why won’t Excel just leave us alone?)


Return to RStudio and open your project. Look at your _Files_ tab in the lower right window. Click on the _CSV_ file you saved and choose __View File__. Success!

  <br>

  <hr>
  </p></details>


  # | A new package &#x1F4E6;
  <hr>

  A _package_ is a small add-on for R like a phone App for your phone. Packages add capabilities like statistical functions, mapping powers, and special charts. In order to use a new package we first need to install it.


## _readr_
<hr>

  ![](https://d21ii91i3y6o6h.cloudfront.net/gallery_images/from_proof/9289/medium/1447092171/readr-hexbin-sticker-from-rstudio.png){align="left" width="145" style="margin-right:18px;"}

<br>

  The _readr_ package helps import data into R in different formats. It does extra work for you like cleaning the data of extra white space and formatting tricky dates. Your packages are stored in your R _library_.

<br><br>

  __Add a package to your library__

1. Open _RStudio_
1. Type ` install.packages("readr") ` in the lower left console
1. Press Enter
1. _Wait two seconds_
1. Open the `Packages` tab in the lower right window of RStudio to see the packages in your _library_
- Use the search bar to find the `readr` package

<br>

  The packages tab only shows the available packages that are installed. To use one of them, you will need to load it. Loading a package is like opening an App on your phone. To load a package we need to use the `library()` function. After loading the _readr_ package you can read the Jakku scrap data with the brand new function `read_csv() `.

<br>


  ## Read the data
  <hr>

  ```{r starwars_read, eval = T}

library("readr")

read_csv("data/starwars_scrap_jakku.csv")
```

<br>

  __NOTE:__ When your project is open, RStudio sets the working directory to your project folder. When reading in files or data from a folder outside of your project, you will need to use the full file path location. For example: `X://Programs/Air_Quality_Programs/Traffic_data.csv`



## Name that Data Frame {-}

Where did the data go after you read it into R? If we want to work with the data in R, we need to give it a name with the assignment operator: `<-`.

```{r starwars_csv_name, eval = T, message = F}

# Read in scrap data and set name to "scrap"
scrap <- read_csv("data/starwars_scrap_jakku.csv")

# Type the name of the table to view it in the console
scrap

```


<br>


  ### <i class="fas fa-user-astronaut" aria-hidden="true" style="color:#040707;"></i> Pro-tip! {-}

  Did you notice the row of <three> letter abbreviations under the column names? These describe the data type of each column.

> `chr` stands for __character__ vector, or a string of characters. Examples: _"apple"_, _"apple5"_, _"5 red apples"_
> `int` stands for __integer__. Examples: _5_, _34_, _1071_
> `dbl` stands for __double__. Examples: _5.0000_, _3.4E-6_, _10.7106_

We will discover more data types later on, such as `dates` and `logical` (TRUE/FALSE).


<div class="quiz">
  ### Pop Quiz! {-}

  __What data type is the `Dest` column?__

<input type="radio"> _letters_        <br>
  <input type="radio"> _character_      <br>
  <input type="radio"> _words_          <br>
  <input type="radio"> _numbers_        <br>
  <input type="radio"> _integer_        <br>

  <br>

  <details>
  <summary class = "btn_code">_Show solution_</summary>
  <p>

  <i class="fa fa-check" aria-hidden="true" style="color: green;"></i> `character`

```{r}
#
```

</p></summary></div>

  <br>


  ### Don’t like the column names? {-}

  We can give new column names to the _col_names_ argument in `read_csv()` like this:

  ```{r, message=F}

# Assign desired column names as a character vector named my_header_names
my_header_names <- c("scrap_type", "source", "destination", "count", "units", "price_per_ton")

scrap <- read_csv("data/starwars_scrap_jakku.csv", col_names = my_header_names)
```



###  Skip a row {-}

We now have the column names we want, but the original column names in our CSV file show up as a row in our data. We want `read_csv` to ignore the first row. Let’s look through the help window and try to find an argument that can help us. The `skip` argument looks like it could be helpful. Sure enough, the description is exactly what we’re looking for here. The default is `skip = 0` (read every line), but we can skip the first line by providing `skip = 1`.

```{r, eval = F}
my_header_names <- c("scrap_type", "source", "destination", "count", "units", "price_per_ton")

read_csv("data/starwars_scrap_jakku.csv", my_header_names, skip = 1)

```

<br>

  <details>
  <summary class = "btn_code_blue"> __EXPLORE:__ Does the order of arguments matter? </summary>
  <p>

  You may be wondering why we included `skip =` for the skip argument, but only provided the objects for the other two arguments. When you pass inputs to a function, R assumes you’ve entered them in the same order that is shown on the ?help page. Let’s say you had a function called `feed_creatures()` with 3 arguments:

  > `feed_creatures(porg = "small fish", ewok = "vegetables", tauntaun = "lichen")`.

A shorthand way to write this would be `feed_creatures("small fish", "vegetables", "lichen")`. This works becuase all the arguments remain in the default order.

However, if we write `feed_creatures("vegetables", "lichen", "small fish")`, the function will send _vegetables_ to the porgs and _lichen_ to the Ewoks. That's no good. If we really want to write "lichen" second, we need to tell R which food item belongs to each animal, such as `feed_creatures("small fish", tauntaun = "lichen", ewok = "vegetables")`.

The same thing goes for `read_csv()`. In `read_csv(scrap_file, column_names, skip = 1)`, R assumes the file is `scrap_file` and that the col_names should be set to `column_names`. The `skip =` argument has to be included explicitly because _skip_ is the __10th__ argument in `read_csv()`. If we don’t include `skip = `, R will assume the value we entered is meant for the function’s __3rd__ argument.

</p></details>


<br>


### <i class="fas fa-user-astronaut" aria-hidden="true" style="color:#040707;"></i> Pro-tip! {-}

A shortcut to see all possible function arguments is to enter its name in the console followed by the first parenthesis, such as ` read_csv( `. Now press `TAB` on the keyboard. This will bring up a drop-down menu of all the available arguments for that function.



## Saving file paths
<hr>

You can also save file paths as objects, such as `file_path <- "data/starwars_scrap_jakku.csv"`. Now you can use it as a shortcut to the location of your data. When you want to load the scrap table you can write `read_csv(file_path)`. This handy trick makes it easier for you or your coworker to update your code and use it with new data.

```{r, message=F}

# Save the file path to an object you can use later
file_path <- "data/starwars_scrap_jakku.csv"

scrap <- read_csv(file_path)
```



<div class="quiz">
### Pop Quiz!   {-}

<br>

__What package does `read_csv()` come from?__

<input type="radio"> _dinosaur_     <br>
<input type="radio"> _get_data_     <br>
<input type="radio"> _readr_        <br>
<input type="radio"> _dplyr_        <br>
<input type="radio"> _tidyr_        <br>

<br>
<details>
<summary class = "btn_code">_Show solution_</summary>
<p>

<i class="fa fa-check" aria-hidden="true" style="color: green;"></i> `readr`

_Great job! You are Jedi worthy!_

</p></details></div>

<div class="quiz" style="margin-top: -15px;">
<br>

__How would you load the package `junkfinder`?__

<input type="radio"> _junkfinder()_              <br>
<input type="radio"> _library("junkfinder")_     <br>
<input type="radio"> _load("junkfinder")_        <br>
<input type="radio"> _package("junkfinder")_     <br>

<br>
<details>
<summary class = "btn_code">_Show solution_</summary>
<p>

<i class="fa fa-check" aria-hidden="true" style="color: green;"></i> `library("junkfinder")`

_Excellent! Keep the streak going._

</p></details></div>



# | ggplot2
<hr>

#### _Plot the data, Plot the data, Plot the data_ {-}


![](https://images.duckduckgo.com/iu/?u=https%3A%2F%2Fd21ii91i3y6o6h.cloudfront.net%2Fgallery_images%2Ffrom_proof%2F9296%2Fmedium%2F1447173871%2Frstudio-hex-ggplot2-dot-psd.png&f=1){width="164" style="float: left; margin-right: 26px; margin-top: 10px;  margin-left: 0;"}

<br>

In data analysis it is really important to look at your data early and often. For that, let’s add a new package called  __ggplot2__!
<br><br>

Install it using: `install.packages("ggplot2")`

<br><br><br>

__NOTE:__ You can also install packages from the `Packages` tab on the lower right window of RStudio.


## A first plot {-}

Here’s a quick chart of how many of each item we have in the dataset.

```{r, fig.width=12}
library(ggplot2)

ggplot(scrap, aes(x = Origin, y = Amount)) + geom_col()

```

Hmmm... Looks like there is an **All** category that we should look into more.


## Key terms {-}
<hr>

`package  ` — An add-on for R that contains new functions that someone created to help you. It’s like an App for R.
`library  ` — The name of the folder that stores all your packages, and the function used to load a package.


# Data exploration {-}

# | __dplyr__
<hr>

![](https://d33wubrfki0l68.cloudfront.net/071952491ec4a6a532a3f70ecfa2507af4d341f9/c167c/images/hex-dplyr.png){width="128" align="left" style="margin-right: 28px; margin-top: 8px; margin-bottom: 12px;"}

<br>

_You’ve unlocked a new package!_

The _dplyr_ package is the go-to tool for exploring, re-arranging, and summarizing data.

<br><br>

Use `install.packages("dplyr")` to add _dplyr_ to your library.

<br>

__Your new analysis toolbox__

| Function      | Job                                                 |
|:--------------|:----------------------------------------------------|
| `select()`    | Select individual columns to drop, keep, or reorder |
| `arrange()`   | Reorder or sort rows by value of a column           |
| `filter()`    | Pick a subset of rows by the value of a column      |
| `mutate()`    | Add new columns or update existing columns          |
| `summarize()` | Calculate a single summary for the entire table     |
| `group_by()`  | Split data into groups by values in a column        |



# | Porg examples {.tabset}

## `porgs` {-}

![](images/porgs/porgs_tbl.png){style="width: 85%;"}

<br><hr><br>

## `select`    {-}

![](images/porgs/select.png){style="width: 65%;"}

![](images/porgs/select_tbl.png){style="width: 88%; margin-left: 10%; margin-top: 12px;"}

<br><br>

![](images/porgs/select_drop.png){style="width: 65%;"}

![](images/porgs/select_drop_tbl.png){style="width: 80%; margin-left: 5%; margin-top: 12px;"}

<br><hr><br>

## `arrange`   {-}

![](images/porgs/arrange.png){style="width: 65%;"}

![](images/porgs/arrange_tbl.png){style="width: 88%; margin-left: 10%; margin-top: 12px;"}

<br><br>

![](images/porgs/arrange_desc.png){style="width: 57%;"}

![](images/porgs/arrange_tbl_desc.png){style="width: 88%; margin-left: 10%; margin-top: 12px;"}

<br><hr><br>

## `filter`    {-}

![](images/porgs/filter.png){style="width: 65%;"}

![](images/porgs/filter_tbl.png){style="width: 88%; margin-left: 10%; margin-top: 12px;"}

<br><br>

![](images/porgs/filter2.png){style="width: 75%;"}

![](images/porgs/filter2_tbl.png){style="width: 88%; margin-left: 10%; margin-top: 12px;"}


<br><hr><br>

## `mutate`    {-}

![](images/porgs/mutate.png){style="width: 77%;"}

<br>

![](images/porgs/mutate_tbl.png){style="width: 88%; margin-left: 4%; margin-top: 12px;"}

<br><hr><br>

## `summarize` {-}

![](images/porgs/summarize.png){style="width: 77%;"}

<br>

![](images/porgs/summarize_tbl.png){style="width: 88%; margin-left: 4%; margin-top: 12px;"}

<br><hr><br>

## `group_by`  {-}

![](images/porgs/groupby.png){style="width: 77%;"}

<br>

![](images/porgs/groupby_tbl.png){style="width: 94%; margin-left: 2%; margin-top: 12px;"}

<br><hr><br>



# | `select()`
<hr>

Use the `select()` function to:

- Drop a column you no longer need
- Pull-out a few columns to create a new table
- Rearrange or change the order of columns



## Drop columns with a minus sign: `-column_name` {-}
```{r select, warning = F, message = F}
library("dplyr")

# Drop the destination column
select(scrap, -Dest)
```



## Drop multiple columns with `-c(col_1, col_2)` or `-col1, -col2` {-}
```{r arrange2, warning = F, message = F}

# Drop the destination and units columns
select(scrap, -c(Dest, Units, Amount))
```


## Keep only three columns {-}
```{r arrange3, warning = F, message = F}

# Keep the Salvage, Amount and Price_per_Ton columns
select(scrap, c(Salvage, Amount, Price_per_Ton))
```


## `everything()` {-}

`select()` also works to change the order of columns. The code below puts the `Salvage` column first and then moves the `Units` and `Amount` columns directly after `Salvage`. We then keep `evertyhing()` else the same.

```{r arrange4, warning = F, message = F}

# Make the `Salvage`, `Units`, and `Amount` columns the first three columns
# Leave `everything()` else in the same order
select(scrap, Salvage, Units, Amount, everything())
```



# | `arrange()`
<hr>

That’s helpful, but Rey wants to know what the highest priced Salvage items are. Use `arrange()` to find the origin city with the most highest priced Salvage item.

```{r select-arrange, warning = F}
# find the least expensive Salvage items
scrap <- arrange(scrap, Price_per_Ton)

# View the top 6 rows using head()
head(scrap)
```


<br>

#### Well darn, that's not a very impressive price. {-}


## Big things first: `desc()`  {-}

To arrange a column in descending order we use: `desc(Price_per_Ton)`

```{r descend, warning = F}
# Put most expensive items on top
scrap <- arrange(scrap, desc(Price_per_Ton))

# View the top 6 rows
head(scrap)
```


<br>


  ### <i class="fa fa-starwars" aria-hidden="true" style="color: green"></i> Exercise {-}

  Try arranging by more than one column (such as `Price_per_Ton` and `Amount`). What happens?

  __HINT:__ You can view the entire table by clicking on it in the upper-right _Environment_ tab.

<br>

  ### <i class="fas fa-user-astronaut" aria-hidden="true" style="color:#040707;"></i> Pro-tip! {-}

  > When you save an arranged data table it maintains its order. This is perfect for sending people a quick __Top 10__ list of pollutants or sites.

<br><br>


  ![](images/boba_tea.jpg){width="300"}


# | `filter()`
<hr>

  The `filter()` function creates a subset of the data based on the value of one or more columns. Let's take a look at the "All" category records.

```{r filter12, eval = F}

filter(scrap, Origin == "All")

```


### <i class="fas fa-user-astronaut" aria-hidden="true" style="color:#040707;"></i> Pro-tip! {-}

> We use a `==` (double equals sign) for comparing values. A `==` makes the comparison "is it equal to?" and returns a True or False answer. So the code above returns all the rows where the condition `Origin == "All"` is TRUE.
>
> A single equals sign `=` is used within functions to set options, for example `read_csv(file = "starwars_scrap_jakku.csv")`. Don't worry too much. If you use the wrong symbol R is often helpful and will let you know which one is needed.


## Comparisons
<hr>

  To use filtering effectively you will want to know how to select observations using various comparison operators.

<br>

  __Key comparison operators__

| Symbol| Comparison               |
  |:------|:-------------------------|
  | `>`   | greater than             |
  | `>=`  | greater than or equal to |
  | `<`   | less than                |
  | `<=`  | less than or equal to    |
  | `==`  | equal to                 |
  | `!=`  | not equal to             |
  | `%in%`| value is in a list       |

  <br>

  Now let’s look at that data again WITHOUT the _All_ category. Then we will more easily be able to see the amounts. Look in the table above and find the `NOT` operator.

```{r filter all}

scrap <- filter(scrap, Origin != "All")

```


<br>

  Now we’ll arrange the data in descending order by `Amount` and then look at the data using the `head()` function to confirm that the "All" category is gone.

```{r filter_arrange}

scrap <- arrange(scrap, desc(Amount))

head(scrap)

```

<br>

  Now let’s take another look at that bar chart. Is there anything else that is less than perfect with our data?

  ```{r ggplot-noAll}
ggplot(scrap, aes(x = Origin, y = Amount)) + geom_col()
```


Something still might be hidden in the data that is unexpected. Take a look at the amount of items in each units category.

```{r ggplot-Units}
ggplot(scrap, aes(x = Units, y = Amount)) + geom_col()
```

There is still an issue with the data. The item "tons" is written two ways. This happens when multiple field technicians collect data! We will deal with this a bit later.


## Multiple filters
<hr>

  We can add multiple comparisons to `filter()` to further restrict the data we pull from a larger data set. Only the records that pass the conditions of all the comparisons will be pulled into the new data frame.

The code below filters the data to only scrap records originating in the `Outskirts` __AND__ destined for `Niima Outpost`.

```{r filter-multi, eval=F}

outskirts_to_niima <- filter(scrap,
                             Origin == "Outskirts",
                             Dest   == "Niima Outpost")
```

### {- .tabset}

#### <i class="fa fa-starwars" aria-hidden="true" style="color: green"></i> Exercise {-}

<br>

  Create a new data frame that only includes `Retrorocket` and `Sublight drive` that are priced higher than 500 credits. Give the new data frame a detailed name, something like `highend_starship_junk`.

_Work with your neighbor to complete the code below and create the new data frame._

```{r filter2, eval=F}

highend_starship_junk <- filter(scrap,
                                _____________,
                                _____________)
```

<br><br><hr>

  #### Show hint {-}
  <br>

  __HINT:__ You can use `c(...)` and the `%in%` operator to test for multiple values.

```{r filter-hint, eval=F}

highend_starship_junk <- filter(scrap,
                                ________ %in% c("_______", "______"),
                                ________ > 500)

```
<br><br><hr>


  #### Show code {-}
  <br>
  ```{r filter-code, eval = F}

highend_starship_junk <- filter(scrap,
                                Salvage %in% c("Retrorocket", "Sublight drive"),
                                Price_per_Ton > 500)

```
<br><br><hr>


  ### {-}

  <div class="quiz">
  ### The scrap challenge! <i class="fa fa-rocket" aria-hidden="true"></i> {-}

  1. Use `filter()` and multiple comparisons to isolate a single item you wish to buy in the data set. Bonus points for using `%in%`.
2. Copy your super filter code and paste into an e-mail to your neighbor.
3. Run your neighbor's code and confirm their wished-for salvage item.

<br>
</div>


# | Update from BB8!
<hr>

![](images/rey_bb8.jpg){width="276" align="right" style="margin-top: 0px; margin-left: 15px; margin-right: 0px;"}

BB8 was able to recover the full scrap data from the notorious Junk Boss Unkar Plutt. Check your data folder for the new dataset named `starwars_scrap_jakku_full.csv`.

You already know Rey needs parts for her star ship. So let's see if you can sway Rey to trade with scrappers from your home City on Jakku.

<br>

  > __Look under your keyboard to find the name of your City in Jakku.__

<br>


  ### More scrap {-}

  First, let’s read in the full dataset.

```{r read-full}
file_path <- "data/starwars_scrap_jakku_full.csv"

scrap <- read_csv(file_path)

```

<br>

  It looks like there are additional units of salvage items beyond "tons". We may have some data cleaning to do.


# | `glimpse()`
<hr>

  Take a minute to look at the full scrap transfer data. An R function called _glimpse()_ is a good place to start.

<br>

  ```{r glimpse-full}

glimpse(scrap)

```

<br>

  You can see that the units in the full data set are in "Items", "Cubic Yards". And you remember from before that there were also units of "TONS" and "Tons".

<br>

  ### {- .tabset}

  #### <i class="fa fa-starwars" aria-hidden="true" style="color: green"></i> Exercise  {-}
  <br>

  Use `filter()` and `arrange()` to get a new data frame of scrap that originates from your City sorted by `Price_per_Ton`. Then take a look at the first couple of rows in your table to find the Salvage that fetches the highest prices.

```{r, eval=F}

city_scrap <- filter(scrap, _________)

arrange(city_scrap, _________)
```

<br><br><hr>

  #### Show hint {-}
  <br>

  __Hint:__ First filter your data to include only your City in the `Origin` column.

```{r, eval=F}

city_scrap <- filter(scrap, Origin == "...")

my_scrap <- arrange(city_scrap, desc(_________))
```

<br><br><hr>

  #### Show code {-}
  <br>
  ```{r, eval=F}

city_scrap <- filter(scrap, Origin == "Outskirts")

my_scrap <- arrange(city_scrap, desc(Price_per_Ton))

```

<br><br><hr>



  <details>
  <summary class="btn_code_blue"> Challenge 2: Find your neighbor's `Origin` city </summary>
<p>

<br>

Now let's see if you can use `mutate()` to help match the description of the Salvage from your City. Give your neighbor a series of clues about your origin city based on facts about the Salvage from that location.

Here's a hint for ways to describe your City by describing its Salvage scrap data.

> My City's name starts with a T.
> My City sold more than 1000 Acceleration compensators to a Trade Caravan.
> The total price was at least 800 credits.

Use `filter()`, and `arrange()` to describe your City by its Salvage scrap. Then, provide this information to your neighbor and have them figure out what City you are from.

Here's a snippet to get you started.
```{r neighbor1, eval=F}

library("dplyr")

## Filter down your data to the type of salvage in the hint
my_scrap <- filter(scrap, Salvage == "Acceleration compensator")

##arrange the data by
my_scrap <- arrange(my_scrap, desc(Amount))

```
<br>

</p></details>




## Congratulations! You’ve completed __Day 1__. {-}
<hr>

![](https://media1.tenor.com/images/ce269fabe989f148f84d339850ce9a8f/tenor.gif?itemid=3561486)

<br>

You’ve earned a Star Wars film fan award! Hopefully you found a way to help Rey and your home City.



# | Shutdown complete

When you close RStudio it will ask you about saving your _workspace_ and other files. This can get tiresome after awhile. Follow the steps below to set these options once and for always.

Turn off __"Save Workspace"__

- Go to __Tools__ on the top RStudio navigation bar.
- Choose `Global Options...`.
- On the first screen:
- Set _Save workspace to .RData on exit:_ to "Never".
- Uncheck _Always save history_
- Uncheck _Restore .Rdata into workspace at startup_



<br><br>

### <i class="fa fa-hourglass-half" aria-hidden="true" style="color:#040707;"></i> __RECAP__ {-}

>
> - What packages have we added to our `library`?
>
> - What new functions have we learned?
>


# <i class="fa fa-rocket" aria-hidden="true"></i> Return to [Homebase](index.html) {-}

<br>
