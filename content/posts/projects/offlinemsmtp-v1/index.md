---
title: offlinemsmtp v1
date: 2026-06-05T13:00:00-06:00
categories:
  - Projects
tags:
  - offline
  - msmtp
  - email
  - mutt
image: images/offlinemsmtp-no-pad.png
hide_image_in_index: true
---

<center>
{{<image src="images/offlinemsmtp-no-pad.png" link="https://github.com/sumnerevans/offlinemsmtp" width="50%" nozoom="true" nodim="true" nowebp="true" rawlink="true">}}
</center>

I [announced]({{<ref"../introducing-offlinemsmtp/index.md">}})
[offlinemsmtp](https://github.com/sumnerevans/offlinemsmtp) in 2019. It's a
program that allows queueing email messages to send using `msmtp` (part of
[isync](https://isync.sourceforge.io)). Today, at long last, I'm releasing a
stable v1 version of [offlinemsmtp](https://github.com/sumnerevans/offlinemsmtp)
after rewriting the project in Go. The release can be found
[on GitHub](https://github.com/sumnerevans/offlinemsmtp/releases/tag/v1.0.0).

In general, the functionality of v0.4.0 is preserved, however if you were using
some uncommonly-used features, you may need to update your configuration
slightly. This version also relicenses the project under the MIT license.

## Breaking Changes

- Installation and building now uses the Go tooling. You can no longer install
  from pip. See
  [the installation instructions](https://github.com/sumnerevans/offlinemsmtp#installation)
  for the latest instructions for installation.
- Arguments passed to `msmtp` must now be separated by `--` (e.g.
  `offlinemsmtp -C ~/.msmtprc -- -t --read-envelope-from`). Previously,
  unrecognised flags were forwarded automatically.
- Log levels use zerolog names (`trace`, `debug`, `info`, `warn`, `error`)
  instead of Python's `DEBUG`, `WARNING`, etc.
- `-l` now logs to both STDERR and the specified file simultaneously. This is
  likely not breaking in most cases, but relevant if you were relying on
  receiving no output from the program.

## New Features

- **Network Online Detection:** when NetworkManager reports the network has come
  online, offlinemsmtp tries to send enqueued emails (no need to wait for the
  next flush interval).
- **Notifications have been greatly improved.**
  - They now show the email subject so you can tell which message is being sent,
    succeeded, or failed.
  - The "Sending..." notification stays visible until the send completes or
    fails, then updates in place with the result.
- **Additional Configuration Options**
  - `--debounce-interval` (default 10s) prevents repeated sends when multiple
    filesystem events arrive in quick succession.
  - `--msmtp-path` lets you specify the full path to the msmtp binary, useful on
    NixOS and other non-standard PATH setups.
