#!/bin/sh
mysql -h clondb3 -u alarm -e \
"use ALARM;
SELECT NAME, TITLE, DETAIL
FROM ALARM_TREE, AUTOMATED_ACTION
WHERE (ALARM_TREE.COMPONENT_ID = AUTOMATED_ACTION.COMPONENT_ID)
AND (DETAIL LIKE 'mailto:%' ) ;"  \
-p\$alarm

