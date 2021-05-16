#!/bin/bash
php parser_example.php
cat item.txt| jq -r ' [.id, .name, .balance] | join(";")' > item.csv
