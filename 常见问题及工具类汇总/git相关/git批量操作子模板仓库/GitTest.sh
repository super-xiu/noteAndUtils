#!/bin/bash
address1="http://admin@10.179.2.14:10101/r/Library/FVC1/AutoSAR/DFCV/MCAL.git "
address2="http://admin@10.179.2.14:10101/r/Library/FVC1/AutoSAR/DFCV/RTE.git"
address=(${address1} ${address2})
for(( i=0;i<${#address[@]};i++))
do
	cd /c/Users/liangxing.xiu/Desktop/test01
	git clone ${address[i]}
	a=${address[i]##*/}
	b=${a%.*}
	cd ${b}
	echo "hello" > hello.txt
	git add ./
	git commit -m "test01"
	rm hello.txt
	git add ./
	git commit -m "test02"
	git push origin master
	cd /c/Users/liangxing.xiu/Desktop/gitFun/C_DFCV_AEB_MCU
	git submodule add ${address[i]}
	git submodule init
	git submodule update
	git add ./
	git commit -m "submodule"
	git push origin master
done



