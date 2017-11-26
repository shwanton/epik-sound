#!/bin/bash

lftp -u $EPIKSOUND_FTP_USER,$EPIKSOUND_FTP_PASSWORD $EPIKSOUND_FTP_HOSTNAME -e 'set ftp:ssl-allow no; mirror --reverse --verbose build/ /; ls; quit'
