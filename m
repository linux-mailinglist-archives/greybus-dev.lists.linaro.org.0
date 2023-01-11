Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BD66661C0
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jan 2023 18:26:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E66093EF78
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jan 2023 17:26:11 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id EC7BD3EF78
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jan 2023 17:26:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=fTRr1wKf;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0641BB81C86;
	Wed, 11 Jan 2023 17:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBF8C433D2;
	Wed, 11 Jan 2023 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673457961;
	bh=NP2y6S++5x5+MUjd094n7ofaKtyxtCts0E9o4Nm2WhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTRr1wKfHYmqMZ5v6bSHbTdMA2ka1a7Nnlw8K+fSSkbq5Nr2+xsgG8Vvz5DEPQD52
	 XR2Cznr9+ibqxJEcnihsl/sg6Vh2djlx3pRKodDWjmQRIBlAKjzo7+kIlVPkgvQHMI
	 yrw5+uzjR5x1ilAAvGAbjb6VtLqjULGI7zS64eanDyOLLjzf/PkwGczFQO7xcQqQjd
	 FJmDKFouwNkx7lnnjYBz0EgNP2G6vmdBMkX0pkssT+PSVrx7K+jv8jWH2S94kyAu9L
	 cBIRYZTienPKKu4yaJKGBFHwJd3LvTBTgHgoanYP7+r7vzXHHbGTegkozs3mIeN3J1
	 y63M2Wkx05RMw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pFerW-00047W-B0; Wed, 11 Jan 2023 18:26:06 +0100
Date: Wed, 11 Jan 2023 18:26:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Message-ID: <Y77xLmLCbldH1VOX@hovoldconsulting.com>
References: <20230111142331.34518-1-ilpo.jarvinen@linux.intel.com>
 <20230111142331.34518-8-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230111142331.34518-8-ilpo.jarvinen@linux.intel.com>
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+a:ams.source.kernel.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,kernel.org,igalia.com,enneenne.com,arndb.de,linaro.org,gmail.com,pengutronix.de,nxp.com,suse.com,lists.linaro.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EC7BD3EF78
X-Spamd-Bar: ------
Message-ID-Hash: GNSPVCJMKVCSHG3W4LJV2ALZTPGVVLXF
X-Message-ID-Hash: GNSPVCJMKVCSHG3W4LJV2ALZTPGVVLXF
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, Samuel Iglesias =?utf-8?Q?Gons=C3=A1lvez?= <siglesias@igalia.com>, Rodolfo Giometti <giometti@enneenne.com>, Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>, David Lin <dtwlin@gmail.com>, Alex Elder <elder@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 07/13] tty: Convert ->dtr_rts() to take bool argument
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GNSPVCJMKVCSHG3W4LJV2ALZTPGVVLXF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBKYW4gMTEsIDIwMjMgYXQgMDQ6MjM6MjVQTSArMDIwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6DQo+IENvbnZlcnQgdGhlIHJhaXNlL29uIHBhcmFtZXRlciBpbiAtPmR0cl9ydHMoKSB0
byBib29sIHRocm91Z2ggdGhlDQo+IGNhbGxjaGFpbi4gVGhlIHBhcmFtZXRlciBpcyB1c2VkIGxp
a2UgYm9vbC4gSW4gVVNCIHNlcmlhbCwgdGhlcmUNCj4gcmVtYWlucyBhIGZldyBpbXBsaWNpdCBi
b29sIC0+IGxhcmdlciB0eXBlIGNvbnZlcnNpb25zIGJlY2F1c2Ugc29tZQ0KPiBkZXZpY2VzIHVz
ZSB1OCBpbiB0aGVpciBjb250cm9sIG1lc3NhZ2VzLg0KPiANCj4gSW4gbW94YV90aW9jbWdldCgp
LCBkdHIgdmFyaWFibGUgd2FzIHJldXNlZCBmb3IgbGluZSBzdGF0dXMgd2hpY2gNCj4gcmVxdWly
ZXMgaW50IHNvIHVzZSBhIHNlcGFyYXRlIHZhcmlhYmxlIGZvciBzdGF0dXMuDQo+IA0KPiBSZXZp
ZXdlZC1ieTogSmlyaSBTbGFieSA8amlyaXNsYWJ5QGtlcm5lbC5vcmc+DQo+IFNpZ25lZC1vZmYt
Ynk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2NoYXIvcGNtY2lhL3N5bmNsaW5rX2NzLmMgICAgfCAgNCArLS0NCj4gIGRy
aXZlcnMvbW1jL2NvcmUvc2Rpb191YXJ0LmMgICAgICAgICB8ICA0ICstLQ0KPiAgZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvdWFydC5jICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvdHR5L2FtaXNl
cmlhbC5jICAgICAgICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL3R0eS9odmMvaHZjX2NvbnNv
bGUuYyAgICAgICAgfCAgNCArLS0NCj4gIGRyaXZlcnMvdHR5L2h2Yy9odmNfY29uc29sZS5oICAg
ICAgICB8ICAyICstDQo+ICBkcml2ZXJzL3R0eS9odmMvaHZjX2l1Y3YuYyAgICAgICAgICAgfCAg
NCArLS0NCj4gIGRyaXZlcnMvdHR5L21veGEuYyAgICAgICAgICAgICAgICAgICB8IDU0ICsrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvdHR5L214c2VyLmMgICAgICAgICAg
ICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL3R0eS9uX2dzbS5jICAgICAgICAgICAgICAgICAg
fCAgMiArLQ0KPiAgZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMgICAgIHwgIDggKyst
LS0NCj4gIGRyaXZlcnMvdHR5L3N5bmNsaW5rX2d0LmMgICAgICAgICAgICB8ICAyICstDQo+ICBk
cml2ZXJzL3R0eS90dHlfcG9ydC5jICAgICAgICAgICAgICAgfCAgNCArLS0NCj4gIGRyaXZlcnMv
dXNiL2NsYXNzL2NkYy1hY20uYyAgICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL3VzYi9zZXJp
YWwvY2gzNDEuYyAgICAgICAgICAgfCAgMiArLQ0KPiAgZHJpdmVycy91c2Ivc2VyaWFsL2NwMjEw
eC5jICAgICAgICAgIHwgIDQgKy0tDQo+ICBkcml2ZXJzL3VzYi9zZXJpYWwvY3lwcmVzc19tOC5j
ICAgICAgfCAgNiArKy0tDQo+ICBkcml2ZXJzL3VzYi9zZXJpYWwvZGlnaV9hY2NlbGVwb3J0LmMg
fCAgNiArKy0tDQo+ICBkcml2ZXJzL3VzYi9zZXJpYWwvZjgxMjMyLmMgICAgICAgICAgfCAgMiAr
LQ0KPiAgZHJpdmVycy91c2Ivc2VyaWFsL2Y4MTUzNC5jICAgICAgICAgIHwgIDIgKy0NCj4gIGRy
aXZlcnMvdXNiL3NlcmlhbC9mdGRpX3Npby5jICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL3Vz
Yi9zZXJpYWwvaXB3LmMgICAgICAgICAgICAgfCAgMiArLQ0KPiAgZHJpdmVycy91c2Ivc2VyaWFs
L2tleXNwYW4uYyAgICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvdXNiL3NlcmlhbC9rZXlzcGFu
X3BkYS5jICAgICB8ICAyICstDQo+ICBkcml2ZXJzL3VzYi9zZXJpYWwvbWN0X3UyMzIuYyAgICAg
ICAgfCAgNCArLS0NCj4gIGRyaXZlcnMvdXNiL3NlcmlhbC9teHVwb3J0LmMgICAgICAgICB8ICAy
ICstDQo+ICBkcml2ZXJzL3VzYi9zZXJpYWwvcGwyMzAzLmMgICAgICAgICAgfCAgMiArLQ0KPiAg
ZHJpdmVycy91c2Ivc2VyaWFsL3F1YXRlY2gyLmMgICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMv
dXNiL3NlcmlhbC9zaWVycmEuYyAgICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL3VzYi9zZXJp
YWwvc3BjcDh4NS5jICAgICAgICAgfCAgMiArLQ0KPiAgZHJpdmVycy91c2Ivc2VyaWFsL3NzdTEw
MC5jICAgICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvdXNiL3NlcmlhbC91cGQ3OGYwNzMwLmMg
ICAgICB8ICA2ICsrLS0NCj4gIGRyaXZlcnMvdXNiL3NlcmlhbC91c2Itc2VyaWFsLmMgICAgICB8
ICAyICstDQo+ICBkcml2ZXJzL3VzYi9zZXJpYWwvdXNiLXd3YW4uaCAgICAgICAgfCAgMiArLQ0K
PiAgZHJpdmVycy91c2Ivc2VyaWFsL3VzYl93d2FuLmMgICAgICAgIHwgIDIgKy0NCj4gIGRyaXZl
cnMvdXNiL3NlcmlhbC94cl9zZXJpYWwuYyAgICAgICB8ICA2ICsrLS0NCj4gIGluY2x1ZGUvbGlu
dXgvdHR5X3BvcnQuaCAgICAgICAgICAgICB8ICA0ICstLQ0KPiAgaW5jbHVkZS9saW51eC91c2Iv
c2VyaWFsLmggICAgICAgICAgIHwgIDIgKy0NCj4gIDM4IGZpbGVzIGNoYW5nZWQsIDg0IGluc2Vy
dGlvbnMoKyksIDgyIGRlbGV0aW9ucygtKQ0KDQpTYW1lIGhlcmUuIE5vIG5lZWQgdG8gbHVtcCB0
aGUgdHR5LXBvcnQgY2hhbmdlcyB3aXRoIFVTQi1zZXJpYWwgY2hhbmdlcy4NCg0KSm9oYW4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
