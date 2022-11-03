#!/bin/bash
sudo kill -9 $(sudo lsof -t -i4:9090)