#!/bin/sh

rc-update add inotifyd default
rc-status
rc-service inotifyd start
