oc project ace
set +e
oc delete BuildConfig afp-ace-produce
set -e
oc create -f yaml/aceIVTConfig.yaml

set -e
set tw=0

bash -x createConfig.sh policyproject kakfa-policy config/eventstreamspolicyproject.zip
bash -x createConfig.sh truststore kafka.jks config/kafka.jks
bash -x createConfig.sh setdbparms kafka-parms config/eventstreams-setdbparms.txt

oc start-build afp-ace-produce 
