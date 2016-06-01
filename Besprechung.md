# Messen
apache jmeter http://jmeter.apache.org/

    apache - nginx

    einfach Bilder anbieten

    (Typo3)

    Ohne LB wegen Cache


# Aktuell
FS sind Master Slave
Mit NFS3. Hat Limit. Evtl hat NFS4 keine.

# Problem

    Kleine Bilder 10K JPEG mit Testbilder aus Internet

    100 bis 150 Clients auf die Webseite 30 bis 50 Bilder

    Zeitliche Abstand der Clients ca 10 Sekunden


Alternativen:
    - Samba nicht wegen Win-Netz
    - GlusterFS mit Replikation - Langsam wegen Overhead https://www.gluster.org/
    + lsyncd aufsatz auf rsync Filnotificationhandler https://github.com/axkibe/lsyncd

        mit SSH

    +/- zfs Partition für neues Setup

Etherpad:
https://etherpad.wikimedia.org/p/nfs-projekt
