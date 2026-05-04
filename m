Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U0Y8F45n+GnwuAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 04 May 2026 11:31:58 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C94084BAF20
	for <lists+greybus-dev@lfdr.de>; Mon, 04 May 2026 11:31:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A950C409AD
	for <lists+greybus-dev@lfdr.de>; Mon,  4 May 2026 09:31:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 0591540994
	for <greybus-dev@lists.linaro.org>; Mon,  4 May 2026 09:31:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=bTvNNvOy;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9243260125;
	Mon,  4 May 2026 09:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44684C2BCB8;
	Mon,  4 May 2026 09:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777887112;
	bh=jK7LX7CZZc6vAL2TRvrSWHbkmr37igAqzuml4yVAFMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTvNNvOyUQnDUk9HijCP1jx6eqymW90Q2cpLkrTh1jI6gWBTDeMbyWor3SN0lwKj+
	 M0h0EugNAbetQIZMYZkAUA4ocRZ811PTHm7lP6IImzjzYLtwtJ0fz4/z9Pz4ESTKv1
	 HWN/kH9H4IIKCI/6VzEIrk2VwohVB//h70GOr4pgLGbanl7NBwozKCJXdfJiIZDCes
	 Af55zZ+jcDOHWQ1KeJ/rgnUTrCmLnMLv7txxD+NJkpB2XcbQZkO60AYTbhQv90MvLL
	 cAlYdDz0D7XYBwnctqLCyYq8Km+tHst7XO5iV2pwfXuSqZBcQlYaD3kf19MqspdZab
	 YKA+y+CGsEd5Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wJpeX-00000001lnX-2NlD;
	Mon, 04 May 2026 11:31:49 +0200
Date: Mon, 4 May 2026 11:31:49 +0200
From: Johan Hovold <johan@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
Message-ID: <afhnhcMVSBLYboEo@hovoldconsulting.com>
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
 <20260504-wip-fix-core-v3-1-ce1f11f4968f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504-wip-fix-core-v3-1-ce1f11f4968f@kernel.org>
X-Spamd-Bar: ----
Message-ID-Hash: 7M6LKDGOSSK3ONZQAP6UO23SXJTITEJY
X-Message-ID-Hash: 7M6LKDGOSSK3ONZQAP6UO23SXJTITEJY
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Kosina <jikos@kernel.org>, Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Alex Elder <elder@kernel.org>, Lee Jones <lee@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/4] HID: pass the buffer size to hid_report_raw_event
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7M6LKDGOSSK3ONZQAP6UO23SXJTITEJY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C94084BAF20
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
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	NEURAL_HAM(-0.00)[-0.986];
	DKIM_TRACE(0.00)[kernel.org:-]

On Mon, May 04, 2026 at 10:47:22AM +0200, Benjamin Tissoires wrote:
> commit 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing
> bogus memset()") enforced the provided data to be at least the size of
> the declared buffer in the report descriptor to prevent a buffer
> overflow. However, we can try to be smarter by providing both the buffer
> size and the data size, meaning that hid_report_raw_event() can make
> better decision whether we should plaining reject the buffer (buffer
> overflow attempt) or if we can safely memset it to 0 and pass it to the
> rest of the stack.
> 
> Fixes: 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing bogus memset()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
>  drivers/hid/bpf/hid_bpf_dispatch.c |  6 ++++--
>  drivers/hid/hid-core.c             | 42 +++++++++++++++++++++++++-------------
>  drivers/hid/hid-gfrm.c             |  4 ++--
>  drivers/hid/hid-logitech-hidpp.c   |  2 +-
>  drivers/hid/hid-multitouch.c       |  2 +-
>  drivers/hid/hid-primax.c           |  2 +-
>  drivers/hid/hid-vivaldi-common.c   |  2 +-
>  drivers/hid/wacom_sys.c            |  6 +++---
>  drivers/staging/greybus/hid.c      |  2 +-

The Greybus change builds fine now:

Acked-by: Johan Hovold <johan@kernel.org>

>  include/linux/hid.h                |  4 ++--
>  include/linux/hid_bpf.h            | 14 ++++++++-----
>  11 files changed, 53 insertions(+), 33 deletions(-)

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
