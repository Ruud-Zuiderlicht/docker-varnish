#!/bin/bash

TIME=$(date +%s)
varnishadm vcl.load r_$TIME /etc/varnish/default.vcl
varnishadm vcl.use r_$TIME
