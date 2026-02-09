#!/bin/bash
cd "$(dirname "$0")/.."

rm -rf output
rm -f main.aux main.log main.out main.pdf main.vrb \
      main.nav main.snm main.toc main.bbl main.bcf \
      main.blg main.run.xml main_test.* \
      _80D1384B945DB004EEEEC20E678A1F85*

echo "Cleanup complete!"
