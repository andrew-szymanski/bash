#!/bin/bash

tom () {
 name=Tom
 color=Red
 weight=30
}

jerry () {
 name=jerry
 color=blue
 weight=40
}

robot () {
  "${1}"
  echo "${name}"
  echo "${color}"
  echo "${weight}"
}

robot tom
color="pinkish"
robot jerry
