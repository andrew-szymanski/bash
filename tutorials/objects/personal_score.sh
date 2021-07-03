#!/bin/bash

#                      **************************
#                      ****** robot example
#                      **************************
andrew () {
  name="Andrew"
  local cmd="$1"
  case "${cmd}" in
    "add_score")
      points="$2"
      echo "   adding [${points}] points to ${name}..."
      [ -n "${score}" ] || score=0
      score=$(( ${score} + ${points} ))
      ;;
  esac
}

daz () {
  name="Darren"
  local cmd="$1"
  case "${cmd}" in
    "add_score")
      points="$2"
      echo "   adding [${points}] points to ${name}..."
      [ -n "${score}" ] || score=0
      score=$(( ${score} + ${points} ))
      ;;
  esac
}

add_score () {
  ${1} add_score ${2}
}

print_score () {
  "${1}"
  echo "${name} has ${score} points"
}

#                      **************************
#                      ****** pseudo "person" object
#                      **************************
# don't hide the fact that globals are globals but make them unique instead
person () {
  local cmd="$1"
  local name="$2"
  score_variable_name="score_${name}"
  [ -n "${!score_variable_name}" ] || ( echo "   ${name}: initialising score..." ; declare -i ${score_variable_name}=0 )  # make sure score is 0 if not set yet
  case "${cmd}" in
    "add_score")
      points="$3"
      echo "   ${name}: adding [${points}]..."
      local new_value="$(( ${!score_variable_name} + ${points} ))"
      printf -v "$score_variable_name" '%s' ${new_value}
      ;;
    "print_score")
      echo "${name} has ${!score_variable_name} points"
      ;;
  esac
}

add_score_generic () {
  person add_score ${1} ${2}
}

print_score_generic () {
  person print_score ${1}
}

#                            ****************************
#                            **** main
#                            ****************************

echo "****************************************"
echo "****** robot example ain't gonna cut it:"
echo "******  -) 'objects' are simply functions with global vars"
echo "******  -) 'objects' data is initialised from scratch on every call"
echo "******  -) duplicate code per 'person' - impossible to maintain"
echo "****************************************"
add_score "andrew" "3"
print_score "andrew"
add_score "andrew" "5"
print_score "andrew"
add_score "daz" "7"
print_score "daz"  # WRONG! prints 15
echo ""
echo ""
echo "****************************************"
echo "****** pseudo objects"
echo "******  -) don't hide the fact that globals are globals but make them unique instead"
echo "******  -) values are not re-assigned every time"
echo "******  -) one function for all people"
echo "****************************************"
add_score_generic "andrew" "3"
print_score_generic "andrew"
add_score_generic "andrew" "5"
print_score_generic "andrew"
add_score_generic "daz" "7"
print_score_generic "daz"
add_score_generic "daz" "3"
print_score_generic "daz"
