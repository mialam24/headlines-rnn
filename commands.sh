#!/bin/bash

API_KEY=$1

ruby nytimes-article-api.rb $API_KEY apple 20000101 20171215 200
ruby nytimes-article-api.rb $API_KEY apple 20130614 20171215 200
ruby nytimes-article-api.rb $API_KEY bitcoin 20000101 20171215 200
ruby nytimes-article-api.rb $API_KEY google 20000101 20171215 200

#####

python train.py --batch_size 200 --seq_length 200 --num_epoch 400 --learning_rate 0.001 --data_dir=../headlines-rnn/data/ # APPLE
