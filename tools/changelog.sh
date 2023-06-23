#!/bin/bash

# Exports
DEVICE=$(echo $TARGET_PRODUCT | sed 's/lineage_//g')
out=$OUT_DIR/target/product/$DEVICE
if [ -f $out ]; # The path does not exist
then
	echo "The path to create changelog does not exist, exiting..."
	exit
fi

export Changelog=Changelog.txt

if [ -f $Changelog ];
then
	rm -f $Changelog
fi

touch $Changelog

# Print something to build output
echo "Generating changelog..."

    # # Cycle through all available repos
	 	export After_Date=$(/usr/bin/date --date="14 days ago" +%Y/%m/%d)
     REPO_LIST="$(repo list --path | sed 's|^vendor/OTA$||')"
     for repo_path in $REPO_LIST; do
         # Find commits from 13 days ago until now
         GIT_LOG="$(git -C "$repo_path" log --since=$After_Date --pretty=format:"%cd - %s (by %an)" --date=format:"%Y-%m-%d")"
         [ -n "$GIT_LOG" ] && {
             printf '\n------------------------------------------  ';
			 printf '\n'
			 echo "$repo_path"
	 		 echo "------------------------------------------"
             echo "$GIT_LOG"
			 printf '\n'
         } >> $Changelog
     done

cp $Changelog $OUT_DIR/target/product/$DEVICE/system/etc/$Changelog
cp $Changelog $OUT_DIR/target/product/$DEVICE/
