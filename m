Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCCHIuEG+2mbVQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 06 May 2026 11:16:17 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9304D8736
	for <lists+greybus-dev@lfdr.de>; Wed, 06 May 2026 11:16:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B7D83404DF
	for <lists+greybus-dev@lfdr.de>; Wed,  6 May 2026 09:16:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 39E8F3F7E9
	for <greybus-dev@lists.linaro.org>; Wed,  6 May 2026 09:16:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="ODNh/plo";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of lee@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=lee@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E6014380D;
	Wed,  6 May 2026 09:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C31C2BCB8;
	Wed,  6 May 2026 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778058972;
	bh=1kYG0k2tEVtubWrZEIB0wmkkpyz8/sB/Ms4TujhtBms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODNh/plooM7UycNr844RLfOUm4vHHusx1hm5rm4AUkC6eJPcnunHvk/oYolPGPgUy
	 GOMQ7hZKjVwa7/+hCQpFJEdyTVtgPoXdQ7KlU+KUtrfVwZa/qAltkSRBpFgZ2ADB4y
	 s2VflufvWVXD9/rV5Seoh0IDCoCvjHLFnRyQ2kkoEfIGYI8/yE5GhZbWa7CZ7jiPha
	 FVIyhNSMz90vdixi2FrlM7gxP1ui0UXK240uOhqoTWMCoh1ySdL9vB9R41qk6AFkdK
	 KsUbHQCKyYP7d/nKwe9WDG2OX5XRWcfrwHNG6jfoVOzCIXAAaDaBX5NPzUlumDI90L
	 fg5P606Bw1d9g==
Date: Wed, 6 May 2026 10:16:06 +0100
From: Lee Jones <lee@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
Message-ID: <20260506091606.GB305027@google.com>
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
X-Spamd-Bar: ---
Message-ID-Hash: 7JN7MUSMRPOHNRLSDRTGSUGKTPKEEZMX
X-Message-ID-Hash: 7JN7MUSMRPOHNRLSDRTGSUGKTPKEEZMX
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Kosina <jikos@kernel.org>, Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 0/4] HID: Proper fix for OOM in hid-core
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7JN7MUSMRPOHNRLSDRTGSUGKTPKEEZMX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0B9304D8736
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	NEURAL_HAM(-0.00)[-0.995];
	DKIM_TRACE(0.00)[kernel.org:-]

On Mon, 04 May 2026, Benjamin Tissoires wrote:

> Commit 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing
> bogus memset()") enforced the provided data to be at least the size of
> the declared buffer in the report descriptor to prevent a buffer
> overflow.
> 
> We only had corner cases of malicious devices exposing the OOM because
> in most cases, the buffer provided by the transport layer needs to be
> allocated at probe time and is large enough to handle all the possible
> reports.
> 
> However, the patch from above, which enforces the spec a little bit more
> introduced both regressions for devices not following the spec (not
> necesserally malicious), but also a stream of errors for those devices.
> 
> Let's revert to the old behavior by giving more information to HID core
> to be able to decide whether it can or not memset the rest of the buffer
> to 0 and continue the processing.
> 
> Note that the first commit makes an API change, but the callers are
> relatively limited, so it should be fine on its own. The second patch
> can't really make the same kind of API change because we have too many
> callers in various subsystems. We can switch them one by one to the safe
> approach when needed.
> 
> The last 2 patches are small cleanups I initially put together with the
> 2 first patches, but they can be applied on their own and don't need to
> be pulled in stable like the first 2.
> 
> Cheers,
> Benjamin
> 
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
> Changes in v3:
> - fixed ghib -> ghid in greybus
> - fixed i386 size_t debug size reported by kernel-bot
> - Link to v2: https://lore.kernel.org/r/20260416-wip-fix-core-v2-0-be92570e5627@kernel.org
> 
> Changes in v2:
> - added a small blurb explaining the difference between the safe and the
>   non safe version of hid_safe_input_report
> - Link to v1: https://lore.kernel.org/r/20260415-wip-fix-core-v1-0-ed3c4c823175@kernel.org
> 
> ---
> Benjamin Tissoires (4):
>       HID: pass the buffer size to hid_report_raw_event
>       HID: core: introduce hid_safe_input_report()
>       HID: multitouch: use __free(kfree) to clean up temporary buffers
>       HID: wacom: use __free(kfree) to clean up temporary buffers
> 
>  drivers/hid/bpf/hid_bpf_dispatch.c |  6 ++--
>  drivers/hid/hid-core.c             | 67 ++++++++++++++++++++++++++++++--------
>  drivers/hid/hid-gfrm.c             |  4 +--
>  drivers/hid/hid-logitech-hidpp.c   |  2 +-
>  drivers/hid/hid-multitouch.c       | 18 ++++------
>  drivers/hid/hid-primax.c           |  2 +-
>  drivers/hid/hid-vivaldi-common.c   |  2 +-
>  drivers/hid/i2c-hid/i2c-hid-core.c |  7 ++--
>  drivers/hid/usbhid/hid-core.c      | 11 ++++---
>  drivers/hid/wacom_sys.c            | 46 +++++++++-----------------
>  drivers/staging/greybus/hid.c      |  2 +-
>  include/linux/hid.h                |  6 ++--
>  include/linux/hid_bpf.h            | 14 +++++---
>  13 files changed, 109 insertions(+), 78 deletions(-)

What's the plan for this set Benjamin? -rcs or -next?

-- 
Lee Jones
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
