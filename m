Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDbbDLZayWmvxgUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Mar 2026 19:00:38 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EB00D353315
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Mar 2026 19:00:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 05BF23F8E9
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Mar 2026 17:00:37 +0000 (UTC)
Received: from outbound.mr.icloud.com (p-west2-cluster4-host12-snip4-9.eps.apple.com [57.103.69.150])
	by lists.linaro.org (Postfix) with ESMTPS id 7ECD33F719
	for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2026 14:52:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=icloud.com header.s=1a1hai header.b=b1Yw1dKF;
	dmarc=pass (policy=quarantine) header.from=icloud.com;
	spf=pass (lists.linaro.org: domain of hadichokr@icloud.com designates 57.103.69.150 as permitted sender) smtp.mailfrom=hadichokr@icloud.com
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-8 (Postfix) with ESMTPS id 1F7EE1801CE3;
	Sat, 28 Mar 2026 14:51:59 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1774709521; x=1777301521; bh=XtAt2KO1shOSvecZrU8Dkaw3WH67f2TehIPpq93+OM0=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=b1Yw1dKFDxjxyNLL3vnm4juXR+4sQYNkwPOw6/JrbI9j8SY3y/9G2OwldSf9wBWJNgfKhJN4BstMjSTk8YzHYgBQw+P9TtWIsHovx9j7p5lfPnWPhrYwUWCa2Of1nSXPYX5Kb4y7m/CivEeeYIobGuB41UB8hL3uiOU/GtnrY0kjSP7AW/y1hw9ZquAYZzQXLqRF4Tga3duyaaUwL9H5oOoyw0pjmOR2kRIju2hEDXIPQYmltuvr7WagISJNDQ1funDt8noYgGmcx9b79HnU4Ygr5VSggXOs7faDrZkhqhIfP9qWt5d5AXQJZCQBq5E/Z4Vx79kRNLwEMtD2L2TV7Q==
Received: from [192.168.178.67] (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-8 (Postfix) with ESMTPSA id 6D96F1801CDD;
	Sat, 28 Mar 2026 14:51:57 +0000 (UTC)
Message-ID: <6c54c6bc-7c1a-4a3b-8135-eb9c5925c9a8@icloud.com>
Date: Sat, 28 Mar 2026 15:51:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Greg KH <gregkh@linuxfoundation.org>,
 Shivam Gupta <shivgupta751157@gmail.com>
References: <20260328044527.10489-1-shivgupta751157@gmail.com>
 <2026032850-riverbed-distant-f96b@gregkh>
Content-Language: en-US
From: Hadi Chokr <hadichokr@icloud.com>
In-Reply-To: <2026032850-riverbed-distant-f96b@gregkh>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDEwOSBTYWx0ZWRfXweZTdG6sVWyP
 khYnRXIYfdxSLdt2i64uENj2WsZlhyhdgKEYxVQB26NPaAr7iOUWvKGutmKge632fQKVP0lbpdJ
 yRjF5efAph0ZQdvkNKMy1cCkefQtnMeKFH1wjsIBDCqhgtVckNYZ1wvGxkCsDufhJ8urXva1I9t
 BBByAriIignw2Qbt1HKdieUPVjT3TjWbL7ZN4ufir+GKNKOSbcXsdJDSVAC0MlMy8kza/WF3Y8y
 nICduqsAHSnhVf/GfV2yv9uN+pyObrHNOSQYlpcUzknaPQdsdYQldnZT3/GmW1jHX2UoJaWygE1
 AYna7tKXu2MSkcRwZoNM9yE/Nsox305sZfOM7Jr8DVLF6xjaBGG5dq0lEiUvoE=
X-Proofpoint-GUID: 6DVosfPnyux8w8fRN7IebEbeYdMtWOlu
X-Proofpoint-ORIG-GUID: 6DVosfPnyux8w8fRN7IebEbeYdMtWOlu
X-Authority-Info-Out: v=2.4 cv=bo5BxUai c=1 sm=1 tr=0 ts=69c7eb11
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=x7bEGLp0ZPQA:10 a=r945xf9LNZYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=c712CcIMuawOq68mQ6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603280109
X-Spamd-Bar: -------
X-MailFrom: hadichokr@icloud.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ANTHQOGWCK4ATLZ2MRCFYSZMIXXVSWCS
X-Message-ID-Hash: ANTHQOGWCK4ATLZ2MRCFYSZMIXXVSWCS
X-Mailman-Approved-At: Sun, 29 Mar 2026 17:00:30 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_manager: Add missing newline to sysfs_emit outputs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ANTHQOGWCK4ATLZ2MRCFYSZMIXXVSWCS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[icloud.com : SPF not aligned (relaxed),quarantine];
	DATE_IN_PAST(1.00)[26];
	R_DKIM_REJECT(1.00)[icloud.com:s=1a1hai];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[icloud.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	FROM_NEQ_ENVFROM(0.00)[hadichokr@icloud.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[icloud.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,icloud.com:mid]
X-Rspamd-Queue-Id: EB00D353315
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiBPbiBTYXQsIE1hciAyOCwgMjAyNiBhdCAxMDoxNToyN0FNICswNTMwLCBTaGl2YW0gR3VwdGEg
d3JvdGU6DQo+PiBzeXNmc19lbWl0IG91dHB1dHMgaW4gYXVkaW9fbWFuYWdlcl9tb2R1bGUuYyBk
byBub3QgaW5jbHVkZSBhIHRlcm1pbmF0aW5nDQo+PiBuZXdsaW5lLCB3aGljaCBpcyByZXF1aXJl
ZCBmb3IgcHJvcGVyIHN5c2ZzIGZvcm1hdHRpbmcuDQo+Pg0KPj4gQWRkIG5ld2xpbmUgY2hhcmFj
dGVycyB0byBhbGwgc3lzZnNfZW1pdCBmb3JtYXQgc3RyaW5ncy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBTaGl2YW0gR3VwdGEgPHNoaXZndXB0YTc1MTE1N0BnbWFpbC5jb20+DQo+IFlvdSBqdXN0
IGNoYW5nZWQgdGhlIHVzZXIva2VybmVsIGFwaSBoZXJlLCBhcmUgeW91IF9zdXJlXyBpdCBpcyBv
ayB0byBkbw0KPiBzbz8gIFdoYXQgdG9vbHMganVzdCBicm9rZSBvciB3ZXJlIHVzZWQgdG8gdGVz
dCB0aGlzPyAgV2hhdCB0b29sIGFza2VkDQo+IHlvdSB0byBtYWtlIHRoaXMgY2hhbmdlPw0KPg0K
PiB0aGFua3MsDQo+DQo+IGdyZWcgay1oDQo+DQpJJ20gbm90IHRoZSBhdXRob3IsIGJ1dCBJJ3Zl
IGJlZW4gZ29pbmcgdGhyb3VnaCB0aGUgc3RhZ2luZyB0cmVlLCANCnJ1bm5pbmcgY2hlY2twYXRj
aCBvbiB2YXJpb3VzIGZpbGVzLCBhbmQgcmVhZGluZyBkb2N1bWVudGF0aW9uIHRvIGdldCANCnN0
YXJ0ZWQgd2l0aCBrZXJuZWwgZGV2ZWxvcG1lbnQuIFRoaXMgcGFydGljdWxhciBmaWxlIA0KKGBk
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5jYCkgdHJpZ2dlcnMg
Y2hlY2twYXRjaCANCndhcm5pbmdzIGFib3V0IG1pc3NpbmcgbmV3bGluZXMgaW4gYHN5c2ZzX2Vt
aXRgIGNhbGxzLg0KDQpJdCBzZWVtcyBmaW5lIHRvIG1ha2UgdGhpcyBjaGFuZ2UgdGhvLCBhcyBp
dCByZWZsZWN0cyB0aGUgcHJvcGVyIGtlcm5lbCANCkFQSSBkb2N1bWVudGVkIGluIGBEb2N1bWVu
dGF0aW9uL2ZpbGVzeXN0ZW1zL3N5c2ZzLnJzdGAuIE9uZSBvZiB0aGUgDQpleGFtcGxlcyBhdCBs
aW5lIDI2NiBzaG93cyB0aGUgaW50ZW5kZWQgYmVoYXZpb3VyIGFzOg0KDQogwqAgwqAgc3RhdGlj
IHNzaXplX3Qgc2hvd19uYW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IA0KZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0ciwNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNoYXIgKmJ1ZikNCiDCoCDCoCB7DQogwqAgwqAgwqAgwqAgcmV0dXJuIHN5c2ZzX2VtaXQo
YnVmLCAiJXNcbiIsIGRldi0+bmFtZSk7DQogwqAgwqAgfQ0KDQpTbyB0byBhbnN3ZXIgdGhlIHF1
ZXN0aW9uOiBjaGVja3BhdGNoIGZsYWdnZWQgaXQsIGFuZCB0aGUga2VybmVsIA0KZG9jdW1lbnRh
dGlvbiBjb25maXJtcyB0aGlzIGlzIHRoZSBjb3JyZWN0IHVzYWdlIG9mIHRoZSBmdW5jdGlvbi4N
Cg0KSGFwcHkgdG8gaGVscC4NCg0KSGFkaSBDaG9rcg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBn
cmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
