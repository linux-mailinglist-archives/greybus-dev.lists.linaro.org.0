Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EM0CLBPA2r63gEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 18:05:04 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBCD524522
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 18:05:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 40BF9401C9
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 16:05:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 4345D3EC66
	for <greybus-dev@lists.linaro.org>; Tue, 12 May 2026 16:04:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Rvtoakmb;
	spf=pass (lists.linaro.org: domain of jikos@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=jikos@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD27362D02;
	Tue, 12 May 2026 16:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E61AC2BCB0;
	Tue, 12 May 2026 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778601895;
	bh=yNslzli12YKyZvlTHWY9UvoN4jJ9sdRDmcEAHEZTQQ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Rvtoakmb0htAdo8CaX4xrzAbM8hNYEEz/rLZWgwEdvN8mYD+fJuxiqRV+mKAf0URC
	 KtSOqk1VeAwcBMoXShBGQJraFn3cLRADuvh+XgwMEeX/vOFrL7636Gq0p1rsA0AkU6
	 guhdqOjGfJUp4mw0eRN8SrovG5TQePor5nXmqc7yHnB/9NAbu24YRLYT9ffLXbMGIs
	 ObLcTsT+jTSD3VJew+bWvotIn1Vh0dshpQ44Oh4kZfTYa6L0Qb+oF+dxNa5N4BKnY9
	 Mm017n3Jx/j+ElLTvwaBtcc51UizLCSONG4bYDbpWqnUdIXztV+TvMYixhYpmAgq+N
	 XTj2YaNC6yaBQ==
Date: Tue, 12 May 2026 18:04:52 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
In-Reply-To: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
Message-ID: <op9823q8-55ss-91s3-7690-q5prq170s265@xreary.bet>
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: ---
Message-ID-Hash: UWXCIWQIP4ZJENFJAIWNOLNU62XT7QHZ
X-Message-ID-Hash: UWXCIWQIP4ZJENFJAIWNOLNU62XT7QHZ
X-MailFrom: jikos@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Lee Jones <lee@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 0/4] HID: Proper fix for OOM in hid-core
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UWXCIWQIP4ZJENFJAIWNOLNU62XT7QHZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AEBCD524522
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	FROM_NEQ_ENVFROM(0.00)[jikos@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,xreary.bet:mid]
X-Rspamd-Action: no action

On Mon, 4 May 2026, Benjamin Tissoires wrote:

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

I have now queued the first two in hid.git#for-7.1/upstream-fixes.

I expect the remaining two will be applied once respun with Dmitry's 
suggestion on proper guarding.

Thanks,

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
