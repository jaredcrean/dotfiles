
function docker-tag-dates() {
  curl -X GET $1/v2/$2/manifests/$3 \
      | jq -r '.history[].v1Compatibility' \
      | jq '.created' \
      | sort \
      | tail -n1
  }

# cd dir and ls
#function chpwd() {
#    emulate -L zsh
#    ls
#}

function ldkeys() {

}
