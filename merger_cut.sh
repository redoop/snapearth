input=$1
pname=$2
box="${3}"
echo $box
echo "" > batch_jobs_${pname}.sh 
if [ ! -d "beijing/OUT/clip/${pname}" ]; then
  echo "mkdir -p beijing/OUT/clip/${pname}" >> batch_jobs_${pname}.sh
fi

for name in `ls  beijing/ |grep ${input}`;
do 
  echo "gdal_translate -of GTiff  beijing/${name}/GRANULE/*/IMG_DATA/*TCI.jp2 beijing/OUT/merger/${name}.tif " >> batch_jobs_${pname}.sh
  echo "gdal_translate  -projwin  ${box} -a_ullr  ${box} beijing/OUT/merger/${name}.tif beijing/OUT/clip/${pname}/${name}_clip.tif" >> batch_jobs_${pname}.sh
done
