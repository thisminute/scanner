mkdir -p data
rm -rf data/*
cd data

wget \
   --header="Accept-Language: en-us,en;q=0.5," \
   --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
   --header="Connection: keep-alive" \
   --user-agent="Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0" \
   --referer / \
   -pk -np -A html,css,jpg,svg,png -i ../url.txt
find . -type f \
   -exec sed -i '' s/\<script.\*\>.\*\<\\\/script\>//g {} \; \
   -exec sed -i '' s/\<link.\*as=\"script\".\*\>//g {} \;
   # -exec sed -i '' s/\<link.\*as=\"script\".\*\><\\\/link\>//g {} \; \
