#!/bin/bash

# hacky bare minimum - to be improved upon - get property value from xml file
# eg. ./parse_xml_properties.sh fs.defaultFS /etc/hadoop/conf/core-site.xml
# file format example:
   # <configuration>
   #    <property>
   #       <name>fs.defaultFS</name>
   #       <value>hdfs://si1</value>
   #    </property>
   # </configuration>


set -e

property_name=$1
xml_file=$2


read_dom () {
    local IFS=\>
    read -d \< ENTITY CONTENT
}

PROPERTY_FOUND=false
while read_dom; do
   if [[ $ENTITY = "name" && $CONTENT = "${property_name}" ]]; then
      PROPERTY_FOUND=true
      #echo "ENTITY: [${ENTITY}], CONTENT: [${CONTENT}]"
   fi
   # if propery found - find value next
   if [[ "$PROPERTY_FOUND" = true && $ENTITY = "value" ]]; then
      echo ${CONTENT}
      exit 0
   fi
done < ${xml_file}
