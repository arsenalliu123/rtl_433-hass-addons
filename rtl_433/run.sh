#!/usr/bin/with-contenv bashio

MQTT_HOST=$(bashio::config 'mqtt_host')
MQTT_PORT=$(bashio::config 'mqtt_port')
MQTT_USER=$(bashio::config 'mqtt_user')
MQTT_PASS=$(bashio::config 'mqtt_password')
TASMOTA_TOPIC=$(bashio::config 'tasmota_topic')

OTHER_ARGS=""

echo "Starting rtl_433"
echo $MQTT_USER
rtl_433 -F mqtt://$MQTT_HOST:$MQTT_PORT,user=$MQTT_USER,pass=$MQTT_PASS -F kv -r mqtt/rfraw:$TASMOTA_TOPIC
