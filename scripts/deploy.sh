###
 # @Author: zouyaoji@https://github.com/zouyaoji
 # @Date: 2022-01-28 09:41:32
 # @LastEditTime: 2022-01-28 09:43:55
 # @LastEditors: zouyaoji
 # @Description:
 # @FilePath: \zouyaoji.github.io\scripts\publish.sh
###

cd ./public
git init
git config user.name "zouyaoji"
git config user.email "370681295@qq.com"
git add .
git commit -m "Update docs"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:master

echo "✅ Deploy completed"
