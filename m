Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOeWCxptDGpKhgUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 19 May 2026 16:00:58 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3245802B7
	for <lists+greybus-dev@lfdr.de>; Tue, 19 May 2026 16:00:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2264740961
	for <lists+greybus-dev@lfdr.de>; Tue, 19 May 2026 14:00:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 456BA401E2
	for <greybus-dev@lists.linaro.org>; Tue, 19 May 2026 14:00:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=M+EbYHf7;
	spf=pass (lists.linaro.org: domain of bentiss@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=bentiss@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D932D60207;
	Tue, 19 May 2026 14:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FF3C2BCB3;
	Tue, 19 May 2026 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779199233;
	bh=/8BWuvBDFztKFuX/SlpiEy/37TboyiBX8PxB33yS5Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+EbYHf7BMsznMj3a5Xl5E7giYn7q7kUaN6ipT5y96pivphrWgDWhSDmJSL4DKAPn
	 Bctqhg9ZGSIMPUx/GiOVOhLpLOm8iqGF7gQpt7zz86xFX9swArBRrEeqoZ+GOIXva8
	 9s6cGz8cHaiey4UwgAm2Nvu+hHmh9LtRivg5X1viPxMGUZuKXR2TkqyOZjIcLjHeRg
	 awc+ZZ6k7ccuqet3LPgJeXdzUfBLBFukgfXZtP+JqOwvY8R/Fl5+W8KiqhbBpisNKX
	 kLWOSLOM1lVmFi2soJ6H7JHJR7P9WrYxNnAUK4j8h/+5fkwDrq+8mbdhefhhuIpg2f
	 KnayKD8cfWDbA==
Date: Tue, 19 May 2026 16:00:27 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <agxswzzCNMcxRN1n@beelink>
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
 <20260506091606.GB305027@google.com>
 <20260512101723.GU305027@google.com>
 <20260519111723.GU305027@google.com>
 <agxbD6k60vQYrJ6T@beelink>
 <2026051937-hefty-registry-37b2@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2026051937-hefty-registry-37b2@gregkh>
X-Spamd-Bar: ----
Message-ID-Hash: TYAMVA5MA5WRGMRZV3T7D6QEFMHRB6NX
X-Message-ID-Hash: TYAMVA5MA5WRGMRZV3T7D6QEFMHRB6NX
X-MailFrom: bentiss@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Lee Jones <lee@kernel.org>, Jiri Kosina <jikos@kernel.org>, Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 0/4] HID: Proper fix for OOM in hid-core
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TYAMVA5MA5WRGMRZV3T7D6QEFMHRB6NX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.49 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[bentiss@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RSPAMD_EMAILBL_FAIL(0.00)[bentiss.kernel.org:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: 0F3245802B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On May 19 2026, Greg Kroah-Hartman wrote:
> On Tue, May 19, 2026 at 02:46:13PM +0200, Benjamin Tissoires wrote:
> > On May 19 2026, Lee Jones wrote:
> > > On Tue, 12 May 2026, Lee Jones wrote:
> > > 
> > > > On Wed, 06 May 2026, Lee Jones wrote:
> > > > 
> > > > > On Mon, 04 May 2026, Benjamin Tissoires wrote:
> > > > > 
> > > > > > Commit 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing
> > > > > > bogus memset()") enforced the provided data to be at least the size of
> > > > > > the declared buffer in the report descriptor to prevent a buffer
> > > > > > overflow.
> > > > > > 
> > > > > > We only had corner cases of malicious devices exposing the OOM because
> > > > > > in most cases, the buffer provided by the transport layer needs to be
> > > > > > allocated at probe time and is large enough to handle all the possible
> > > > > > reports.
> > > > > > 
> > > > > > However, the patch from above, which enforces the spec a little bit more
> > > > > > introduced both regressions for devices not following the spec (not
> > > > > > necesserally malicious), but also a stream of errors for those devices.
> > > > > > 
> > > > > > Let's revert to the old behavior by giving more information to HID core
> > > > > > to be able to decide whether it can or not memset the rest of the buffer
> > > > > > to 0 and continue the processing.
> > > > > > 
> > > > > > Note that the first commit makes an API change, but the callers are
> > > > > > relatively limited, so it should be fine on its own. The second patch
> > > > > > can't really make the same kind of API change because we have too many
> > > > > > callers in various subsystems. We can switch them one by one to the safe
> > > > > > approach when needed.
> > > > > > 
> > > > > > The last 2 patches are small cleanups I initially put together with the
> > > > > > 2 first patches, but they can be applied on their own and don't need to
> > > > > > be pulled in stable like the first 2.
> > > > > > 
> > > > > > Cheers,
> > > > > > Benjamin
> > > > > > 
> > > > > > Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> > > > > > ---
> > > > > > Changes in v3:
> > > > > > - fixed ghib -> ghid in greybus
> > > > > > - fixed i386 size_t debug size reported by kernel-bot
> > > > > > - Link to v2: https://lore.kernel.org/r/20260416-wip-fix-core-v2-0-be92570e5627@kernel.org
> > > > > > 
> > > > > > Changes in v2:
> > > > > > - added a small blurb explaining the difference between the safe and the
> > > > > >   non safe version of hid_safe_input_report
> > > > > > - Link to v1: https://lore.kernel.org/r/20260415-wip-fix-core-v1-0-ed3c4c823175@kernel.org
> > > > > > 
> > > > > > ---
> > > > > > Benjamin Tissoires (4):
> > > > > >       HID: pass the buffer size to hid_report_raw_event
> > > > > >       HID: core: introduce hid_safe_input_report()
> > > > > >       HID: multitouch: use __free(kfree) to clean up temporary buffers
> > > > > >       HID: wacom: use __free(kfree) to clean up temporary buffers
> > > > > > 
> > > > > >  drivers/hid/bpf/hid_bpf_dispatch.c |  6 ++--
> > > > > >  drivers/hid/hid-core.c             | 67 ++++++++++++++++++++++++++++++--------
> > > > > >  drivers/hid/hid-gfrm.c             |  4 +--
> > > > > >  drivers/hid/hid-logitech-hidpp.c   |  2 +-
> > > > > >  drivers/hid/hid-multitouch.c       | 18 ++++------
> > > > > >  drivers/hid/hid-primax.c           |  2 +-
> > > > > >  drivers/hid/hid-vivaldi-common.c   |  2 +-
> > > > > >  drivers/hid/i2c-hid/i2c-hid-core.c |  7 ++--
> > > > > >  drivers/hid/usbhid/hid-core.c      | 11 ++++---
> > > > > >  drivers/hid/wacom_sys.c            | 46 +++++++++-----------------
> > > > > >  drivers/staging/greybus/hid.c      |  2 +-
> > > > > >  include/linux/hid.h                |  6 ++--
> > > > > >  include/linux/hid_bpf.h            | 14 +++++---
> > > > > >  13 files changed, 109 insertions(+), 78 deletions(-)
> > > > > 
> > > > > What's the plan for this set Benjamin? -rcs or -next?
> > > > 
> > > > Are there any updates on this set please?
> > > > 
> > > > FYI, this set is still important to us.
> > > > 
> > > > Ideally, if all is well, it would go into the -rcs for v7.1.
> > > 
> > > I'm still actively tracking these.
> > > 
> > > It looks like Mark has been reverting them from -next and I'm getting
> > > complaints from the Stable folks that they are causing build errors.
> > > 
> > >   drivers/hid/hid-core.c: In function 'hid_safe_input_report':
> > >   drivers/hid/hid-core.c:2195:16: error: too many arguments to function '__hid_input_report'
> > >     2195 |         return __hid_input_report(hid, type, data, bufsize, size, interrupt, 0,
> > > 
> > > Are you folks still working on this set?
> > 
> > Well, everything is in Linus' tree:
> > 
> > not yet in a released rc (taken yesterday by Linus directly):
> > 
> > 4d3a2a466b8d HID: core: Fix size_t specifier in hid_report_raw_event()
> > 
> > Already in 7.1-rc4:
> > 
> > 206342541fc8 HID: core: introduce hid_safe_input_report()
> > 2c85c61d1332 HID: pass the buffer size to hid_report_raw_event
> > 
> > Not sure why the patches don't apply to stable, but from an upstream
> > subsystem point of view, everything is in order.
> 
> We dropped them from stable because of the build breakage :(
> 

If that was just the i386 size_t issue, then it has been fixed in Linus'
tree. Could you try retaking them? Please?

Cheers,
Benjamin
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
