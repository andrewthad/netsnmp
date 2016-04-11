module SystemTest.Platform (tests) where

import Control.Exception.Base
import Network.Protocol.NetSNMP
import Test.HUnit
import System.Cmd

tests = test [
   "snmpGet returns correct OID" ~: do
     o <- bracket_
            givenSnmpdRunning
            killSnmpd
            (snmpGet snmp_version_2c "127.0.0.1:6161" "HSTEST" [1,3,6,1,2,1,1,4,0] >>= either error (return . oid))
     o @?= [1,3,6,1,2,1,1,4,0]
 ]

givenSnmpdRunning :: IO ()
givenSnmpdRunning = do
  system $ "cp -f tests/mock.snmpd.conf " ++ mockConfigFilePath
  system ("PATH=$PATH:/usr/sbin:/usr/local/sbin snmpd -r -C -c "++mockConfigFilePath++" 127.0.0.1:6161") >> return ()

killSnmpd :: IO ()
killSnmpd = rawSystem "pkill" ["-9","-f","snmpd"] >> return ()

mockConfigFilePath :: FilePath
mockConfigFilePath = "/tmp/Network.Protocol.NetSNMPtest.snmpd.conf"
