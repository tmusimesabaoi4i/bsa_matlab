## 改行コードを「CRLF」ではなく、「LF」にすること！！
## Make the line feed code "LF" instead of "CRLF"!

LANG=ja_JP.UTF8
rm ./README/README1.md ./README/README2.md ./README/README3.md README.md
cat ./README/step1.md > ./README/README1.md
cat ./README/step2.md ./README/step2_1.md ./README/step2_2.md ./README/step2_3.md ./README/step2_4.md > ./README/README2.md
cat ./README/step3.md ./README/step3_1.md ./README/step3_2.md > ./README/README3.md
cat ./README/tableofcontents.md ./README/README1.md ./README/README2.md ./README/README3.md ./README/program.md ./README/summary.md ./README/references.md > README.md
