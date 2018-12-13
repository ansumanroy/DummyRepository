 while IFS='' read -r line || [[ -n "$line" ]]; do
            IFS='/' read -r -a array <<< "$line"
            if [[ $line != *"->"* ]]; then
                echo "${array[1]}"
                cp -R DummyRepository ${array[1]}
                cd ${array[1]}
                git fetch --all
                git checkout -b ${array[1]}
                git pull
                cd ../
            fi
           IFS=''
done < remoteBranches.txt
