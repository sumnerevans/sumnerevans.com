---
title: Framework 13 Pro Review
date: 2026-10-26T06:25:00-06:00
tags:
  - Framework 13 Pro
  - Review
---

It's been two weeks since I received my Framework 13 Pro, and I am still very
happy about my purchase. I have the Intel® Core™ Ultra 5 325 Series 3 processor
with 16 GB LPCAMM RAM and a 2TB SSD that I took out of my old laptop. You can
get details of my configuration, and the shipping and setup process in my
[first impressions]({{<ref"../framework-13-pro-first-impressions/index.md">}})
post.

In this post, I'm going to provide a more in-depth review of the laptop,
categorising my feedback based on how much I like each aspect.

**Table of Contents** {{< toc >}}

## Differentiator

This category is for standout features that really elevate the experience of
using the Framework 13 Pro. These features truly differentiate this laptop from
others I've used.

### Battery Life

The battery life on this laptop is the best I've ever had on a laptop. I've
historically been used to having less than 5 hours of screen-on-time on a charge
on my previous laptops, but the Framework 13 Pro is getting around 10 hours. It
definitely isn't the 20 hours of battery life that they claim, but it's quite
good.

When I am actively using the laptop with the screen brightness at 20% (which is
plenty for indoor usage), it draws around 6W according to upower. The highest
I've seen it go is 20W when I was playing Geoguessr with the CPU on performance
mode. When idle, I've sometimes seen the laptop drawing less than 5W.

On standby, the battery drains at around 1% every 2 hours[^1]. I can reliably
leave the laptop unplugged overnight, and not worry about it dying unless it's
already below ~10%.

[^1]: Last night I closed my laptop at around 22:00 with the battery percentage
    reading 67%, and turned it on around 8:00 with it reading 62%.

### Fan Noise

My understanding is that the excellent battery life is due primarily to the
improved efficiency of the Intel processors. As a side-effect, the processor
runs cool (it's sitting at 34°C as I'm writing this) and so the fan rarely has
to spin up. I think I've heard the fan spin up once while doing a Nix upgrade.
The chassis also stays cool despite the fans not spinning up.

### Build Quality

I wrote extensively about the build quality in my
[first impressions]({{<ref"../framework-13-pro-first-impressions/index.md">}})
post. The chassis is very solid and I have no complaints.

If I were to nitpick, it would be nice if the front feet on the underside of the
chassis were a bit more pointy. I am used to keeping my laptop open and holding
it by the corner[^2] with my index finger hooked around the foot, and my thumb
on top of the chassis. On the ThinkPad, the foot is very pronounced and it's
easy to grab it and feel secure while holding the laptop. The Framework 13 Pro
has more rounded feet, making this manoeuvre more difficult. However, the need
for holding the laptop open while moving it is significantly decreased because
the Framework wakes from sleep more quickly than any laptop I've ever had.

[^2]: Gotta keep that AI session running amirite?

## Good

This category is for features that work as expected but aren't differentiators
for this laptop.

### Screen

The screen is a 2880x1920 resolution matte screen. I run Hyprland at 1.5x
scaling and it looks great. I can't see any individual pixels without getting
very close to the screen.

The screen wobble has not an issue for me. I don't really use the touchscreen at
all, so that probably helps. When just typing normally, the screen does not have
a noticeable wobble (or at least it doesn't wobble any more than I do from
fidgeting in my chair).

The screen gets plenty bright and plenty dim. I normally run it around 20-30%
indoors, and it's perfectly fine. I took the laptop outside once, the screen
worked in daylight pretty well, even at under 100% brightness. I think that the
matte screen helps a lot. Even indoors, it really reduces glare compared to a
glass screen. That being said, it's weird for a matte screen to be a touch
panel.

A lot of people say the 3:2 aspect ratio is good for programming because it
gives more vertical space. I don't really understand the hype. I don't read the
code anymore anyway.

### Fingerprint Reader

The fingerprint reader is reliable and fast. It's a lot better than my ThinkPad
T14s's fingerprint reader. I don't know how it compares to a MacBook Pro, but it
feels about as reliable as a phone fingerprint reader from about 2020. It's fast
and reliable enough that it's faster than typing my password for login and
`sudo` access.

I did have to add a systemd resume script to restart fprintd on wake from sleep
because of an fprintd bug. Here is the Nix config for fixing this:

[`sumnerevans/nixos-configuration@ac7c358:nixos/hosts/scarif/default.nix:46-56`](https://github.com/sumnerevans/nixos-configuration/blob/ac7c3588de5fc212b4a4693bc9b4e64d95c7c056/nixos/hosts/scarif/default.nix#L46-L56):

```nix
# A suspend race can leave fprintd holding a stale claim on the Goodix
# reader. Restart it asynchronously after resume so it can claim the device
# again. Check the upstream merge request for a fix before removing this:
# https://gitlab.freedesktop.org/libfprint/fprintd/-/merge_requests/259
environment.etc."systemd/system-sleep/fprintd-resume".source =
  pkgs.writeShellScript "fprintd-resume" ''
    if [[ $1 == post ]]; then
      # user.slice stays frozen until this hook exits, so enqueue the restart.
      ${pkgs.systemd}/bin/systemctl --no-block try-restart fprintd.service 2>/dev/null || true
    fi
  '';
```

### Expansion Cards

I have quite a few friends with Framework laptops, and so the expansion cards
are about what I expected. My current expansion card setup is two orange USB-C
expansion cards in the back two slots, an HDMI in the front-left slot, and a
USB-A in the front-right slot. I really like the orange accent, it matches the
orange keyboard accent, and gives some character and playfulness to the laptop.

I don't really have much need to swap out expansion cards on a day-to-day basis.
However it's nice to have the configurability when you need the option to swap
ports from one side to the other. I did that a few days ago to get the HDMI on
the left side to make it easier to plug in to my TV.

### CPU Performance

The Intel® Core™ Ultra 5 325 Series 3[^3] CPU in this thing is pretty good. I
have not had any real issues with the performance. It's not a beast by any
means, but it's fast enough for the largely thin-client workloads that I have.

Having only 16 GB of RAM hasn't been that big of an issue, either, although it
has made me more conscious of what is using up RAM.[^4]

One of the best aspects is that the wake speed is excellent. On a lot of my
previous laptops, it takes on the order of a few seconds to resume from sleep.
With the Framework, this is not a problem. I actually initially thought that
sleep was broken because when I opened the lid, the screen was already on and
waiting for input.

I saw some people on the internet setting up local LLMs on their Framework 13
Pros, so I tried it out. I installed ollama and it is able to run qwen3:1.7b at
130.15 tokens/s. I don't really think it can run a powerful enough model to do
any programming tasks, but it's pretty cool that I can run a local LLM at all.

I also saw someone using Omarchy's dictation feature on their Framework and I
found out that Omarchy uses Voxtype, so I thought I'd set that up in Nix. It
took a bit of effort with Claude to configure properly, but I'm happy to say
that it works pretty well. It's pretty quick, all things considered.

In the same vein as CPU performance, the BIOS is fine. There aren't many
settings that you can configure in there, but I think that's fine. There isn't
really anything that I want to configure since everything is working well out of
the box.

[^3]: Intel, what are you doing with that horrible naming scheme?

[^4]: The other day, I
    [contributed some fixes to hledger-lsp](https://github.com/juev/hledger-lsp/pull/101)
    to reduce its RAM consumption, which I may have just avoided doing if I had
    32 GB of RAM. The absurd amounts of RAM it was allocating also affected the
    performance of the program, though, so I probably would have tried to fix it
    at some point anyway.

### Keyboard

During my
[initial impressions]({{<ref"../framework-13-pro-first-impressions/index.md">}})
I thought the keyboard was a bit more mushy than my ThinkPad, and I still agree
with that assessment. The resistance at the top of the key press is less than I
would like. Overall, though, I got used to the keyboard quickly, and I'm able to
type at 90-100 WPM which is my max speed on any keyboard.

The keyboard backlight works well. You press <kbd>Fn</kbd>+<kbd>Space</kbd> to
cycle between different backlight levels and there is no way to control the
backlight from the OS. (This is similar to how ThinkPads work.) The levels it
cycles through are: off, low, medium, high, and auto. It was not obvious to me
that the last mode was "auto", and it took looking at the Framework
documentation to figure that out. The auto mode seems to prefer backlight levels
that are lower than the "low" level, even in the darkest environments.

### Speakers

Everyone seems to complain about the speakers. I think it's a bit overblown.
They aren't MacBook Pro quality, but they are better than my ThinkPad. I don't
know anyone who buys a laptop for the speakers and people who truly care about
audio quality probably don't think that _any_ laptop speakers are good enough.

I rarely use the speakers on my computer anyway, and the only times I see myself
ever doing so are for watching long-form YouTube videos or listening to
podcasts. For those use cases, the Framework 13 Pro's speakers are totally
sufficient. If I want to listen to music, I'm going to pull out my headphones
and plug them into the headphone jack.

As an actual review of the speakers, the bass is the weakest point, and the
sound stage in the mids is a bit muddled, but the highs are fine. However, I
literally haven't noticed until writing up this review because I use them so
infrequently.

## Detractors

This category is for features that detract from the experience of using the
laptop.

### Trackpad

My biggest disappointment with the laptop so far has been the trackpad. In my
[first impressions]({{<ref"../framework-13-pro-first-impressions/index.md">}})
post, I mentioned that the multifinger detection of the trackpad is a weak
point. It still feels slightly inconsistent, but after a few weeks of using it,
I think the bigger issue is palm rejection. When the left thumb is touching over
the trackpad while I'm using the trackpad with my right hand, it sometimes
registers as a finger on the trackpad. Then, sometimes when I do a three-finger
press with my right hand, the extra finger confuses things and it registers as a
two finger press instead. It also fails to reject my right palm at times, and
since I have focus follow my mouse in hyprland this sometimes causes focus to
switch unexpectedly.

I think that the nice large size of the trackpad, combined with the fact that it
doesn't have physical buttons at the top of the trackpad like ThinkPads do
causes this behaviour.

All this being said, the trackpad is not that bad. The haptics are really good,
and it has a nice smoothness. I've even been able to play Geoguessr just fine
with the trackpad.

## Conclusion

I don't generally have very difficult requirements for my laptops. I don't need
it for gaming, I'm not doing any crazy creative work requiring high colour
accuracy, I'm not producing music or videos. The things I care about are
durability, portability, and battery life, and the Framework 13 Pro satisfies my
requirements in these area.

I am very happy that I bought this laptop, and I see myself using this for many
years to come.
