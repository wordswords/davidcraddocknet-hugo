---
category:
  - solutions-to-a-specific-problem
date: "2008-10-29T20:24:31+00:00"
guid: http://www.davidcraddock.net/?p=24
title: Bacula Scheduling
url: /2008/10/29/linux-backups-using-bacula/

---
Bacula is a great open-source distributed backup program for Linux/UNIX systems. It is separated into three main components:

- One 'Director' - which sends messages to the other components and co-ordinates the backup
- One or more 'File Demons' - which 'pull' the data from the host they are installed from.
- One or more 'Storage Demons' - which 'push' the data taken from the file demons into a type of archival storage, IE: backup tapes, a backup hard disc, etc

I found it extremely versatile yet very complicated to configure. Before you configure it you have to decide on a backup strategy; what you want to backup, why you want to back it up, how often you want to back it up, and how you are going to off-site/preserve the backups.

I can't cover everything about Bacula here, so I thought I'd concentrate on scheduling. You will need to understand quite a lot about the basics of Bacula before you'll be able to understand scheduling, so I recommend reading up on the basics first.

I had the most problems with the scheduling. In the end I chose to adopt this schedule:

- Monthly Full backup, with a retention period of 6 months, and a maximum number of backup volumes of 6.
- Weekly Differential backup against the monthly full backup, with a retention period of 1 month, and a maximum number of backup volumes of 4.
- Daily Incremental backup against the differential backup, with a retention period of 2 weeks, and a maximum number of backup volumes of 14.

This means that there will always be 2 weeks of incremental backups to fall back on which depend on a weekly differential which depends on a monthly full. This strategy aims to save as much space as possible - there is no redundancy. This means that if a backup fails, especially a monthly or weekly, it will have to be re-run immediately.

The backup volumes will cycle using this method; they will be reused once the maxium volume limits are hit. Also, if you run a backup job from the console, it will revert to the 'Default' pool, so you will have to explicitly define either the daily incremental, weekly differential or the monthly full pools.

Here is my director configuration:

```
Job {
  Name = "Backup def"
  Type = Backup
  Client = localhost-fd
  FileSet = "Full Set"
  Storage = localhost-sd
  Schedule = "BackupCycle"
  Messages = Standard
  Pool = Default
  Full Backup Pool = Full-Pool
  Incremental Backup Pool = Inc-Pool
  Differential Backup Pool = Diff-Pool
  Write Bootstrap = "/var/bacula/working/Client1.bsr"
  Priority = 10
}
```

```
Schedule {
  Name = "BackupCycle"
  Run = Level=Full Pool=Full-Pool 1st mon at 1:05
  Run = Level=Differential Pool=Diff-Pool mon at 1:05
  Run = Level=Incremental Pool=Inc-Pool mon-sun at 1:05
}
```

```
# This is the default backup stanza, which always gets overridden by one of the other Pools, except when a manual backup is performed via the console.
Pool {
  Name = Default
  Pool Type = Backup
  Recycle = yes                     # Bacula can automatically recycle Volumes
  AutoPrune = yes                   # Prune expired volumes
  Volume Retention = 1 week         # one week
}
Pool {
  Name = Full-Pool
  Pool Type = Backup
  Recycle = yes           # automatically recycle Volumes
  AutoPrune = yes         # Prune expired volumes
  Volume Retention = 6 months
  Maximum Volume Jobs = 1
  Label Format = "Monthly-Full-${Year}-${Month:p/2/0/r}-${Day:p/2/0/r}-${Hour:p/2/0/r}-${Minute:p/2/0/r}"
  Maximum Volumes = 6
}
Pool {
  Name = Inc-Pool
  Pool Type = Backup
  Recycle = yes           # automatically recycle Volumes
  AutoPrune = yes         # Prune expired volumes
  Volume Retention = 1 month
  Maximum Volume Jobs = 1
  Label Format = "Weekly-Inc-${Year}-${Month:p/2/0/r}-${Day:p/2/0/r}-${Hour:p/2/0/r}-${Minute:p/2/0/r}"
  Maximum Volumes = 4
}
Pool {
  Name = Diff-Pool
  Pool Type = Backup
  Recycle = yes
  AutoPrune = yes
  Volume Retention = 14 days
  Maximum Volume Jobs = 1
  Label Format = "Daily-Diff-${Year}-${Month:p/2/0/r}-${Day:p/2/0/r}-${Hour:p/2/0/r}-${Minute:p/2/0/r}"
  Maximum Volumes = 7
}

```

I also recommend the excellent O'Reilly book - "Backup and Recovery" which comprehensively covers backups, and has a chapter on Bacula.
