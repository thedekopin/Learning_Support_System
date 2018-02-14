import pexpect
import sys

prc = pexpect.spawn("find")
prc.logfile = sys.stdout
prc.expect( pexpect.EOF )
