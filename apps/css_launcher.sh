#!/bin/sh

if [ ! -z $1 ]
then
    css_share_path=$1
else
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    css_share_path=$DIR/../css_share
fi


echo Running css ...

css \
    -pluginCustomization $css_share_path/common/prefs/plugin_customization.ini \
	-share_link $css_share_path=/CLAS12_Share \
	-nosplash &

