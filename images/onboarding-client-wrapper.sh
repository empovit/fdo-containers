#!/bin/sh

delay_sec=${EXIT_DELAY:-30}
echo "#### Will let the FDO client to run for ${delay_sec} sec, then exit ####"

/usr/libexec/fdo/fdo-client-linuxapp &

sleep ${delay_sec}
exit