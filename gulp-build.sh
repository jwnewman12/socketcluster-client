#!/bin/sh

SDK_VERSION=$(cat package.json | sed -n -e '/version/ s/.*: *"\([^"]*\).*/\1/p')
echo "Building JavaScript SDK v$SDK_VERSION...\n"
echo "Cleaning up old builds...\n"
rm -rf socketcluster.js socketcluster.min.js
echo "Browser Release:"
SC_BUILD=browser gulp compile
echo "Bundling and minifying for CDN distribution:"
gulp browserify
gulp minify