#! /bin/sh

set -e
perl tools/inststagedetect.pl test/1362229516.730336.ppm > test/result
diff -u test/result.expected test/result

