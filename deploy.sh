rm -rf docs
hugo -D
mv public docs
cp -R CNAME ./docs/CNAME
git add .
git commit -m new
git push
