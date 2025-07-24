+++
title = 'Cron Jobs Finally Running Reliably'
date = 2025-07-24T17:02:53+01:00
draft = true
+++

FINALLY, with the help of fcron, judicious use of Bash debugging, and a lot of freaking around, I have managed to get scheduled cron jobs running the way I want to.

For a supposedly lightweight process, there are actually a ton of 'gotchas' which will likely trip you up. Here are some tips:

1. Ensure the right permissions for the cron job - cron will ignore scripts that have certain non-standard permissions, for security.
2. Ensure the right filename for the cron job script - it will ignore certain extensions or variations on the end of the script file name!
2. Ensure ALL symbolic links in your cron job scripts are resolved to actual paths - for some reason cron doesn't like this, probably a security measure again.
3. Use fcron with anacron syntax to ensure 'intelligent' scheduling - e.g. if the computer is turned off most of the week, when it is turned back on, it will still run the weekly job, instead of waiting a further 7 days!
4. Make sure you 'cd' into the working directory AS PART of the cron job before you attempt to use any relative (non absolute) paths. And you should do this instead of specifying absolute paths for large scripts, because of the potential to make mistakes, which will take longer to test!
5. Use nohup and a Bash 'trap' error logger to log complete runs. Log the WHOLE output of the Bash cron'd script, using STDERR and STDOUT concatenation.
6. Use screen to run jobs so you can inspect running jobs when you need to.

No wonder Jenkins is so popular!


