#!/bin/bash
sudo kill -9 $(sudo lsof -t -i:9090)