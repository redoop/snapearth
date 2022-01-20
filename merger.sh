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
  echo "sh s2Converter.sh -f GTiff -o beijing/OUT/merger/${name} -i beijing/${name}/GRANULE/*/" >> batch_jobs_${pname}.sh
  echo "/opt/gdal/bin/gdal_translate  -projwin  ${box} -a_ullr  ${box} beijing/OUT/merger/${name}/*.tif beijing/OUT/clip/${pname}/${name}_clip.jpg" >> batch_jobs_${pname}.sh
done
