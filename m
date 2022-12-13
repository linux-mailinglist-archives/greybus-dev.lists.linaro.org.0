Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D2864B9DA
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Dec 2022 17:34:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C35FC3EEAE
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Dec 2022 16:34:36 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 250053EE8E
	for <greybus-dev@lists.linaro.org>; Tue, 13 Dec 2022 16:34:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=knZabNU6;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4C81EB81243;
	Tue, 13 Dec 2022 16:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB8DC433D2;
	Tue, 13 Dec 2022 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670949271;
	bh=lJ13zNvOUtaF6O5/WmH6tvw8NRTXilGhwkFJrT50u4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knZabNU67fZySJZzxlahHXeg56vTE6VWbtEMUpWq18wZ/P1x5mW1BbOxaTlYVvfXA
	 uQejJbUnXNirjVDRnxFYSz87E3YEQB8OXYAyv/gNfrAyzqLNXW72htWZUN+359ber7
	 p3XXFqwQIPHcUc4fszK38aPyEvmftgIkijHGQFV8j0w75NQD6CYsh24wW59p3T8Jmp
	 i5YVPKny1BbCPQ5hZEfP9ZfGEAZMaY4Pp69R17mQuMiY2c98ZiWGjMMbfITGBb7toS
	 jUZSnE+sqtKfwi95jX79HLj5MJ1n65JV5I/CYaQzls5abdQhaEJBlEXR2EWl7iCFVL
	 xfU1wzTvW68Sw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1p58F7-0006K1-CO; Tue, 13 Dec 2022 17:34:58 +0100
Date: Tue, 13 Dec 2022 17:34:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Y5ipsSgRzWBvVlEA@hovoldconsulting.com>
References: <20221212221315.3778788-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221212221315.3778788-1-u.kleine-koenig@pengutronix.de>
X-Rspamd-Queue-Id: 250053EE8E
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[52.25.139.140:received,145.40.68.75:from];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+a:ams.source.kernel.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,pengutronix.de];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_THREE(0.00)[4];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: H3X5ELWPDZXVM5ZGZAKTTKOIFIRA37AV
X-Message-ID-Hash: H3X5ELWPDZXVM5ZGZAKTTKOIFIRA37AV
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: codecs: Drop empty platform remove function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H3X5ELWPDZXVM5ZGZAKTTKOIFIRA37AV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBEZWMgMTIsIDIwMjIgYXQgMTE6MTM6MTVQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6DQo+IEEgcmVtb3ZlIGNhbGxiYWNrIGp1c3QgcmV0dXJuaW5nIDAgaXMgZXF1aXZh
bGVudCB0byBubyByZW1vdmUgY2FsbGJhY2sNCj4gYXQgYWxsLiBTbyBkcm9wIHRoZSB1c2VsZXNz
IGZ1bmN0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCg0KUmV2aWV3ZWQtYnk6IEpvaGFuIEhvdm9sZCA8
am9oYW5Aa2VybmVsLm9yZz4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5s
aW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVh
dmVAbGlzdHMubGluYXJvLm9yZwo=
