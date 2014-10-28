#!/bin/bash
# Build Path: /app/.heroku/php/
dep_url=git://github.com/infusion/PHP-Facedetect.git
phalcon_dir=PHP-Facedetect
echo "-----> Building Phalcon..."
 
### Phalcon
echo "[LOG] Downloading PHP-Facedetect"
git clone $dep_url -q
if [ ! -d "$phalcon_dir" ]; then
  echo "[ERROR] Failed to find PHP-Facedetect directory $phalcon_dir"
  exit
fi
cd $phalcon_dir/build
 
# /app/php/bin/phpize
# ./configure 
# make
# make install

BUILD_DIR=$1
ln -s $BUILD_DIR/.heroku /app/.heroku
export PATH=/app/.heroku/php/bin:$PATH
bash ./install
cd
echo "important extension facedetect into php.ini"
echo "extension=facedetect.so" >> /app/.heroku/php/etc/php/php.ini
