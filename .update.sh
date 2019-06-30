#!/bin/bash

function block_for_change() {
    inotifywait --event move,create,delete "$PWD"
}
function update() {
    find ./* -maxdepth 0 -name '*.sh' >scripts.txt
}
update
while block_for_change; do
    update
done
