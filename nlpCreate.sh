#!bin/bash
read -p "nlp env numbers: " n
echo 'start to create' $n 'nlp env...' 

for p in $(seq 1 $n)
do
	folder='./2019_nlp_'$p

	if [  -d $folder ];then

		echo $folder 'is exist, DON NOT create!!'  

	else	
		echo 'create' $folder
		cp -r 2019_nlp $folder 
		jport='999'$p
		echo 'set' $jport 'to docker-compose.yml in' '2019_testnlp_'$p
		sed -i 's/9999/'${jport}'/' $folder/docker-compose.yml 
		sed -i 's/name:\ jupyter/name:\ jupyter'$p'/' $folder/docker-compose.yml
		chmod -R 777 $folder'/work'

	fi	
done
