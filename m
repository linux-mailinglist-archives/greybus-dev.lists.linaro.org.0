Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCED996C73
	for <lists+greybus-dev@lfdr.de>; Wed,  9 Oct 2024 15:43:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 90A6B44A16
	for <lists+greybus-dev@lfdr.de>; Wed,  9 Oct 2024 13:43:17 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	by lists.linaro.org (Postfix) with ESMTPS id E29C23F38F
	for <greybus-dev@lists.linaro.org>; Wed,  9 Oct 2024 12:48:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=WI0sVayc;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (lists.linaro.org: domain of "prvs=701272e60e=rf@opensource.cirrus.com" designates 67.231.149.25 as permitted sender) smtp.mailfrom="prvs=701272e60e=rf@opensource.cirrus.com"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994xc0x003245;
	Wed, 9 Oct 2024 07:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=b9CbWLDMZti2ojgRTihH3RA0WYLUzEcG7aX6pdihoQY=; b=
	WI0sVaycTZYkwMgmtYcXXMdvigsiua8Ix4Qh02mNCGH2fBXcoCmYBNNsEO5BXVde
	1Bz9WSIl3H9aytV4MjeLGq5iNgl4nMnifXKD7gZBG7Nh0M0RDNAmEax34ZlRrQpc
	BqxwXp6rQsj7d8HBI3neZNecBDiZiUXrqk9SjO/XH7GSP3KBa0vc3lo3Nh2evgTs
	vMpU/eouIhXwHQgJkPlVYadHgMk2W3tKDA7WeoPiKLk9i2DcqwNiAeCbgFtNS1E3
	D/03y3ryRn8KcZ7U0bo3WMxdHCmB9tG9qfIm/V0gyX7oGE/Hh+fOgbX3EkFod4UH
	WWLlkgIPTShr+Vylj7CyYA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4232uy5xfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 07:48:17 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 13:48:15 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 13:48:15 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 33C5E82024A;
	Wed,  9 Oct 2024 12:48:15 +0000 (UTC)
Message-ID: <41a0ad69-912b-4eb3-84f7-fb385433c056@opensource.cirrus.com>
Date: Wed, 9 Oct 2024 13:48:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com>
 <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
X-Proofpoint-GUID: ltWPFp1gnPUjzPmaRQ9EaXCq91PhMVjU
X-Proofpoint-ORIG-GUID: ltWPFp1gnPUjzPmaRQ9EaXCq91PhMVjU
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E29C23F38F
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:67.231.149.25];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:26211, ipnet:67.231.149.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_VERP_SRS(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.931];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,opensource.cirrus.com,lists.linux.dev,lists.linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rf@opensource.cirrus.com,prvs=701272e60e=rf@opensource.cirrus.com];
	DKIM_TRACE(0.00)[cirrus.com:+]
X-Rspamd-Action: no action
X-MailFrom: prvs=701272e60e=rf@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7LDJIFSRZX3GCPZOQJEH6OT4BLVQ6XLF
X-Message-ID-Hash: 7LDJIFSRZX3GCPZOQJEH6OT4BLVQ6XLF
X-Mailman-Approved-At: Wed, 09 Oct 2024 13:43:13 +0000
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, patches@opensource.cirrus.com, iommu@lists.linux.dev, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@l
 ists.linaro.org, asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7LDJIFSRZX3GCPZOQJEH6OT4BLVQ6XLF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMDgvMTAvMjAyNCA3OjI0IHBtLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToNCj4gT24gVHVl
LCBPY3QgOCwgMjAyNCBhdCAxMjozNeKAr0FNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5h
cm8ub3JnPiB3cm90ZToNCj4+DQo+PiBPbiBUdWUsIDggT2N0IDIwMjQgYXQgMDA6MjUsIExhdXJl
bnQgUGluY2hhcnQNCj4+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3Rl
Og0KPj4+DQo+Pj4gSGkgVWxmLA0KPj4+DQo+Pj4gT24gVHVlLCBPY3QgMDgsIDIwMjQgYXQgMTI6
MDg6MjRBTSArMDIwMCwgVWxmIEhhbnNzb24gd3JvdGU6DQo+Pj4+IE9uIE1vbiwgNyBPY3QgMjAy
NCBhdCAyMDo0OSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4+Pj4+IE9uIEZyaSwgT2N0IDA0
LCAyMDI0IGF0IDA0OjM4OjM2UE0gKzAyMDAsIFVsZiBIYW5zc29uIHdyb3RlOg0KPj4+Pj4+IE9u
IEZyaSwgNCBPY3QgMjAyNCBhdCAxMTo0MSwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPj4+Pj4+Pg0K
Pj4+Pj4+PiBIZWxsbyBldmVyeW9uZSwNCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhpcyBzZXQgd2lsbCBz
d2l0Y2ggdGhlIHVzZXJzIG9mIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgdG8NCj4+Pj4+
Pj4gX19wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHdoaWxlIHRoZSBmb3JtZXIgd2lsbCBz
b29uIGJlIHJlLXB1cnBvc2VkDQo+Pj4+Pj4+IHRvIGluY2x1ZGUgYSBjYWxsIHRvIHBtX3J1bnRp
bWVfbWFya19sYXN0X2J1c3koKS4gVGhlIHR3byBhcmUgYWxtb3N0DQo+Pj4+Pj4+IGFsd2F5cyB1
c2VkIHRvZ2V0aGVyLCBhcGFydCBmcm9tIGJ1Z3Mgd2hpY2ggYXJlIGxpa2VseSBjb21tb24uIEdv
aW5nDQo+Pj4+Pj4+IGZvcndhcmQsIG1vc3QgbmV3IHVzZXJzIHNob3VsZCBiZSB1c2luZyBwbV9y
dW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbmNlIHRoaXMgY29u
dmVyc2lvbiBpcyBkb25lIGFuZCBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHJlLXB1cnBv
c2VkLA0KPj4+Pj4+PiBJJ2xsIHBvc3QgYW5vdGhlciBzZXQgdG8gbWVyZ2UgdGhlIGNhbGxzIHRv
IF9fcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKQ0KPj4+Pj4+PiBhbmQgcG1fcnVudGltZV9t
YXJrX2xhc3RfYnVzeSgpLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhhdCBzb3VuZHMgbGlrZSBpdCBjb3Vs
ZCBjYXVzZSBhIGxvdCBvZiBjaHVybnMuDQo+Pj4+Pj4NCj4+Pj4+PiBXaHkgbm90IGFkZCBhIG5l
dyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBkb2VzIHRoZQ0KPj4+Pj4+IHBtX3J1bnRpbWVfcHV0X2F1
dG9zdXNwZW5kKCkgYW5kIHRoZSBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkNCj4+Pj4+PiB0
aGluZ3M/IFRoZW4gd2UgY2FuIHN0YXJ0IG1vdmluZyB1c2VycyBvdmVyIHRvIHRoaXMgbmV3IGlu
dGVyZmFjZSwNCj4+Pj4+PiByYXRoZXIgdGhhbiBoYXZpbmcgdGhpcyBpbnRlcm1lZGlhdGUgc3Rl
cD8NCj4+Pj4+DQo+Pj4+PiBJIHRoaW5rIHRoZSBBUEkgd291bGQgYmUgbmljZXIgaWYgd2UgdXNl
ZCB0aGUgc2hvcnRlc3QgYW5kIHNpbXBsZXN0DQo+Pj4+PiBmdW5jdGlvbiBuYW1lcyBmb3IgdGhl
IG1vc3QgY29tbW9uIHVzZSBjYXNlcy4gRm9sbG93aW5nDQo+Pj4+PiBwbV9ydW50aW1lX3B1dF9h
dXRvc3VzcGVuZCgpIHdpdGggcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIGlzIHRoYXQNCj4+
Pj4+IG1vc3QgY29tbW9uIHVzZSBjYXNlLiBUaGF0J3Mgd2h5IEkgbGlrZSBTYWthcmkncyBhcHBy
b2FjaCBvZiByZXB1cnBvc2luZw0KPj4+Pj4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSwg
YW5kIGludHJvZHVjaW5nDQo+Pj4+PiBfX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgZm9y
IHRoZSBvZGQgY2FzZXMgd2hlcmUNCj4+Pj4+IHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSBz
aG91bGRuJ3QgYmUgY2FsbGVkLg0KPj4+Pg0KPj4+PiBPa2F5LCBzbyB0aGUgcmVhc29uIGZvciB0
aGlzIGFwcHJvYWNoIGlzIGJlY2F1c2Ugd2UgY291bGRuJ3QgZmluZCBhDQo+Pj4+IHNob3J0IGFu
ZCBkZXNjcmlwdGl2ZSBuYW1lIHRoYXQgY291bGQgYmUgdXNlZCBpbiBmYXZvciBvZg0KPj4+PiBw
bV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLiBMZXQgbWUgdGhyb3cgc29tZSBpZGVhcyBhdCBp
dCBhbmQgbWF5YmUNCj4+Pj4geW91IGxpa2UgaXQgLSBvciBub3QuIDotKQ0KPj4+DQo+Pj4gSSBs
aWtlIHRoZSBpZGVhIGF0IGxlYXN0IDotKQ0KPj4+DQo+Pj4+IEkgZG9uJ3Qga25vdyB3aGF0IG9w
dGlvbnMgeW91IGd1eXMgZGlzY3Vzc2VkLCBidXQgdG8gbWUgdGhlIGVudGlyZQ0KPj4+PiAiYXV0
b3N1c3BlbmQiLXN1ZmZpeCBpc24ndCByZWFsbHkgdGhhdCBuZWNlc3NhcnkgaW4gbXkgb3Bpbmlv
bi4gVGhlcmUNCj4+Pj4gYXJlIG1vcmUgd2F5cyB0aGFuIGNhbGxpbmcgcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQoKSB0aGF0IHRyaWdnZXJzDQo+Pj4+IHVzIHRvIHVzZSB0aGUgUlBNX0FVVE8g
ZmxhZyBmb3IgcnBtX3N1c3BlbmQoKS4gRm9yIGV4YW1wbGUsIGp1c3QNCj4+Pj4gY2FsbGluZyBw
bV9ydW50aW1lX3B1dCgpIGhhcyB0aGUgc2ltaWxhciBlZmZlY3QuDQo+Pj4NCj4+PiBUbyBiZSBo
b25lc3QsIEknbSBsb3N0IHRoZXJlLiBwbV9ydW50aW1lX3B1dCgpIGNhbGxzDQo+Pj4gX19wbV9y
dW50aW1lX2lkbGUoUlBNX0dFVF9QVVQgfCBSUE1fQVNZTkMpLCB3aGlsZQ0KPj4+IHBtX3J1bnRp
bWVfcHV0X2F1dG9zdXNwZW5kKCkgY2FsbHMgX19wbV9ydW50aW1lX3N1c3BlbmQoUlBNX0dFVF9Q
VVQgfA0KPj4+IFJQTV9BU1lOQyB8IFJQTV9BVVRPKS4NCj4+DQo+PiBfX3BtX3J1bnRpbWVfaWRs
ZSgpIGVuZHMgdXAgY2FsbGluZyBycG1faWRsZSgpLCB3aGljaCBtYXkgY2FsbA0KPj4gcnBtX3N1
c3BlbmQoKSAtIGlmIGl0IHN1Y2NlZWRzIHRvIGlkbGUgdGhlIGRldmljZS4gSW4gdGhhdCBjYXNl
LCBpdA0KPj4gdGFncyBvbiB0aGUgUlBNX0FVVE8gZmxhZyBpbiB0aGUgY2FsbCB0byBycG1fc3Vz
cGVuZCgpLiBRdWl0ZSBzaW1pbGFyDQo+PiB0byB3aGF0IGlzIGhhcHBlbmluZyB3aGVuIGNhbGxp
bmcgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKS4NCj4gDQo+IFJpZ2h0Lg0KPiANCj4gRm9y
IGFsbW9zdCBldmVyeWJvZHksIGV4Y2VwdCBmb3IgYSBzbWFsbCBidW5jaCBvZiBkcml2ZXJzIHRo
YXQNCj4gYWN0dWFsbHkgaGF2ZSBhIC5ydW50aW1lX2lkbGUoKSBjYWxsYmFjaywgcG1fcnVudGlt
ZV9wdXQoKSBpcw0KPiBsaXRlcmFsbHkgZXF1aXZhbGVudCB0byBwbV9ydW50aW1lX3B1dF9hdXRv
c3VzcGVuZCgpLg0KPiANCj4gU28gcmVhbGx5IHRoZSBxdWVzdGlvbiBpcyB3aHkgYW55b25lIHdo
byBkb2Vzbid0IHByb3ZpZGUgYQ0KPiAucnVudGltZV9pZGxlKCkgY2FsbGJhY2sgYm90aGVycyB3
aXRoIHVzaW5nIHRoaXMgc3BlY2lhbA0KPiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHRo
aW5nLA0KDQpCZWNhdXNlIHRoZXkgYXJlIGZvbGxvd2luZyB0aGUgZG9jdW1lbnRhdGlvbj8gSXQg
c2F5czoNCg0KIkRyaXZlcnMgc2hvdWxkIGNhbGwgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgp
IHRvIHVwZGF0ZSB0aGlzIGZpZWxkDQphZnRlciBjYXJyeWluZyBvdXQgSS9PLCB0eXBpY2FsbHkg
anVzdCBiZWZvcmUgY2FsbGluZw0KcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKS4iDQoNCmFu
ZA0KDQoiSW4gb3JkZXIgdG8gdXNlIGF1dG9zdXNwZW5kLCBzdWJzeXN0ZW1zIG9yIGRyaXZlcnMg
bXVzdCBjYWxsDQpwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZCgpICguLi4pLCBhbmQgdGhlcmVh
ZnRlciB0aGV5IHNob3VsZCB1c2UgdGhlDQp2YXJpb3VzIGAqX2F1dG9zdXNwZW5kKClgIGhlbHBl
ciBmdW5jdGlvbnMgaW5zdGVhZCBvZiB0aGUgbm9uIw0KYXV0b3N1c3BlbmQgY291bnRlcnBhcnRz
Ig0KDQpTbyB0aGUgZG9jdW1lbnRhdGlvbiBzYXlzIEkgc2hvdWxkIGJlIHVzaW5nIHBtX3J1bnRp
bWVfcHV0X2F1dG9zdXNwZW5kKCkNCmluc3RlYWQgb2YgcG1fcnVudGltZV9wdXQoKS4NCg0KU2Vl
bXMgdW5mYWlyIHRvIGNyaXRpY2lzZSBwZW9wbGUgZm9yIGZvbGxvd2luZyB0aGUgZG9jdW1lbnRh
dGlvbi4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5s
aW5hcm8ub3JnCg==
