#!/bin/bash

containers=$(docker container ls -q)
if [[ "$containers" != "" ]]; then
   docker container stop $(docker container ls -q)
else
   echo no containers found
fi

volumes=$(docker volume ls -q)
if [[ "$volumes" != "" ]]; then
   docker volume rm "$volumes"
else
   echo no volumes found
fi

docker container prune -f
