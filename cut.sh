input=$1
box=$2
sh s2Converter.sh -f GTiff -o merger/${input} -i beijing/${input}/GRANULE/*/
#/opt/gdal/bin/gdal_translate  -projwin ${box} -a_ullr ${box} ${input}.OUT/*.tif clip/${input}_clip.jpg
