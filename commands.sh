#!/bin/bash

API_KEY=$1

ruby nytimes-article-api.rb $API_KEY apple 20000101 20171215 200
ruby nytimes-article-api.rb $API_KEY apple 20130614 20171215 113
