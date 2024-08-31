#!/bin/bash

git add .
read -p "Enter commit's name  " name
git commit -m "$name"
git push origin develop
