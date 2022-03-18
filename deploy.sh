rm -rf docs
hugo -D
mv public docs
git add .
git commit -m new
git push
