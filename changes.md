0.3.2.0 - 19. June 2015
        * Make the library compile with GHC 7.10.1

0.3.1.0 - 19. April 2014
        * Make the library work on Debian 7 with ByteString 0.9

0.3.0.6 * OIDpart type is hacked to work correctly on OS X

0.3.0.5 * Tied the OIDPart to the correct C Type of the oid.
          NOTE: This breaks the code on the OS X and we don't know why
                The oid of the SNMP Result can not be read correctly

0.3.0.4 * Reduced the default number of max-repetitions in Bulk PDUs to 30.
          The previous value caused oversized responses on Extreme Network
          switches.

0.3.0.3 * Fixed a bug, where instead of 32 bit, the OID part was set to CLong,
          which became 64 bit in base 4.5

0.3.*   * Switch from Strings to ByteStrings

0.2.*   * Implementation includes snmpBulkWalk
