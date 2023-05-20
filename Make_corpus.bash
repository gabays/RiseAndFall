#!/usr/bin/env bash

echo 'CORPUS'
java -jar xsl/saxon-he-10.3.jar  -xsl:xsl/source_to_txt.xsl -s:xsl/source_to_txt.xsl

echo 'METADATA'
java -jar xsl/saxon-he-10.3.jar -o:metadata.csv -xsl:xsl/make_metadata.xsl -s:xsl/make_metadata.xsl

