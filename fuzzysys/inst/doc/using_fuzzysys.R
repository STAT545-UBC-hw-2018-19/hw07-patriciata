## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example_sets--------------------------------------------------------
library(sets)

# Define example numeric vectors x and y
x <- c(0.7, 0.8, 0.9)
y <- c(0.2, 0.3, 0.4)

sets::fuzzy_logic("Zadeh") # specifies fuzzy logic family as "Zadeh"

sets::.N.(x) # apply negation
sets::.T.(x, y) # conjunction
sets::.S.(x, y) # disjunction

## ----example_sets2-------------------------------------------------------
sets::fuzzy_logic("product") # switch fuzzy logic family

sets::.N.(x)
sets::.T.(x, y)
sets::.S.(x, y)

## ------------------------------------------------------------------------
library(fuzzysys)

## ----example-------------------------------------------------------------
.T(x,y,type="Zadeh")
.T(x,y,type="product")
.T(x,y,type="Fodor")

## ------------------------------------------------------------------------
.S(x,y,type="Zadeh")
.S(x,y,type="product")
.S(x,y,type="Fodor")

## ------------------------------------------------------------------------
x
.N(x,type="Zadeh")
.N(x,type="product")
.N(x,type="Fodor")

## ------------------------------------------------------------------------
library(purrr)
x_list <- list((1:10)/10, 0.5, 0.7)
y_list <- list((10:1)/10, 0.5, 0.7)

## ------------------------------------------------------------------------
# with original `sets` wrapper functions
map2(x_list,y_list,sets::.T.)
# with `fuzzysys` wrapper functions
map2(x_list,y_list,.T)

## ------------------------------------------------------------------------
pmap(list(x_list,y_list,list("Zadeh","product","Fodor")),~.T(..1,..2,type=..3))

