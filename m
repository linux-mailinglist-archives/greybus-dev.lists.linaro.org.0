Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLcdMTba8GkLaQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 28 Apr 2026 18:03:02 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC7A4886BE
	for <lists+greybus-dev@lfdr.de>; Tue, 28 Apr 2026 18:02:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 487C54015C
	for <lists+greybus-dev@lfdr.de>; Tue, 28 Apr 2026 16:02:50 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id D561B3F843
	for <greybus-dev@lists.linaro.org>; Tue, 28 Apr 2026 16:02:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=d7TTGj1J;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of jikos@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=jikos@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EC4643E79;
	Tue, 28 Apr 2026 16:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3048C2BCAF;
	Tue, 28 Apr 2026 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777392154;
	bh=PR0HAnHcP9FFw0OW3Pb/wZoEnXpkvSX5gNthc8F6qiA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d7TTGj1JLMspUrS4pJjw8m2t52WE6MAaG6EASicDPphkulmgsrMlDNXNCr762mZMV
	 aJ+WOCixlTi+dxqhkt2LhqU2937ePIiGIreDJKfW2+c8lip/iIAJQBC0yeJvwN8nCU
	 +6/kkDQrlTHnMMb38ICuWpftjA82BUMEpoUkl/5ekOtTMYj97c1O4xVKMqfShrFQ8u
	 Hc0nW6wYmC7MxDs0UwcAiHcBkF1/ieW2mBF/e4rbHQB5kCTZomZMCY9UTzYlUSu3gg
	 UJZ567b8R5H48SNx3ghhNxseBk+iof7rsWqV0hk+3Y7R37SDcffl4qPmZyEWkiYy/I
	 Afw8Lq5m9Um+g==
Date: Tue, 28 Apr 2026 18:02:31 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
In-Reply-To: <aeXdKFJe8JyatqLR@beelink>
Message-ID: <7679n429-n1o7-s252-rs3s-q6os44979sro@xreary.bet>
References: <20260416-wip-fix-core-v2-0-be92570e5627@kernel.org> <20260416-wip-fix-core-v2-1-be92570e5627@kernel.org> <938e8afadcbf2d7b9f0397e24926224985d9c385.camel@icenowy.me> <aeXdKFJe8JyatqLR@beelink>
MIME-Version: 1.0
X-Spamd-Bar: ---
Message-ID-Hash: J6BEY5ANEUAY66DDMZNBUGQ3ER6RGUJD
X-Message-ID-Hash: J6BEY5ANEUAY66DDMZNBUGQ3ER6RGUJD
X-MailFrom: jikos@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Icenowy Zheng <uwu@icenowy.me>, =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/4] HID: pass the buffer size to hid_report_raw_event
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/J6BEY5ANEUAY66DDMZNBUGQ3ER6RGUJD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2CC7A4886BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[linaro.org:query timed out];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	FROM_NEQ_ENVFROM(0.00)[jikos@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]

On Mon, 20 Apr 2026, Benjamin Tissoires wrote:


> > Oops, "ghid" is misspelled here...
> 
> Damn, you're correct. Sorry.
> 
> Jiri, do you want me to send v3? Or can you fix it while applying?

Normally I'd fix it manually while applying, but kernel test robot found 
newly added compiler warnings in the meantime, so please include that in 
the followup v3.

Thanks,

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
