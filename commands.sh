#!/bin/bash

API_KEY=$1

ruby nytimes-article-api.rb $API_KEY apple 20000101 20171215 200
ruby nytimes-article-api.rb $API_KEY apple 20130614 20171215 200
ruby nytimes-article-api.rb $API_KEY bitcoin 20000101 20171215 200
ruby nytimes-article-api.rb $API_KEY google 20000101 20171215 200
ruby nytimes-article-api.rb $API_KEY google 20110923 20171215 200
