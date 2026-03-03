Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H3CMuZ+pmnhQQAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Mar 2026 07:25:42 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 531201E9979
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Mar 2026 07:25:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9F1E33F795
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Mar 2026 06:25:40 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	by lists.linaro.org (Postfix) with ESMTPS id 31A7D3F6A0
	for <greybus-dev@lists.linaro.org>; Tue,  3 Mar 2026 06:25:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=f0KHXfMn;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none);
	spf=neutral (lists.linaro.org: 209.85.210.171 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82735a41985so3153290b3a.2
        for <greybus-dev@lists.linaro.org>; Mon, 02 Mar 2026 22:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1772519137; x=1773123937; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=awWvbxbqWZOi7iUXZcv03886VYfqd33I7rMD6sOXCcU=;
        b=f0KHXfMncyhhJASR1lfjThsQzQpVG+aB0/z3afk+gF58IxOrsqN5uApJ8nePBiSmGr
         qqbI3GxKGz1u+o36e8fEgdRVjF7g9ZC0HUW1he+DzYmiTrTd0D1odPutq/FCiyyu8iTu
         Z2uKHPhviQPLPYof+BaY/Ua0DXqT1HtWf7/TXLaLXE7IN/Rjmr9cJ5LbIOoS/ELx2+z1
         jiFo1pZRYfYube/H745p5YyiBWdXdsnABgz1qSQUqQO5caem6Jk5+mfCBb/CB+O95taE
         sZVUjX0Y+HHpnJfeoo2Qh6czryoGIsrCtGFWeWIUDKGc4DiX7y2Ocv5RpwqA5REyZrSI
         yspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772519137; x=1773123937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awWvbxbqWZOi7iUXZcv03886VYfqd33I7rMD6sOXCcU=;
        b=pKLEGBZCCuD5EYN9IaDm2Yfw49eDqVY3O0rNOkKk7kuYhsXUsCVoUN2dWdd60ovvg9
         JeYSy5rJgViZhEHhwSc9yN29Cy5i2tNU6WoQATIDNlkrGSykcBJrDvWUdNuvgrNd+33/
         mmqZ/UQc+GoyJCyk9zUs0ZLVKPYOWQOFgnOXVl0tvnBZgT9/uAXSNzBhtC442Z4wztQ4
         Jk3+LuV1O9vXPNai9v/jA9ccKpukIxfCGFIW/DGqII2Dd1QOfgi9lxQKffAdggrdHulO
         MRVvSV5xrJ06PVlhxHF4W3AhjbDw0jppUuP51mSOI4qpxO1Tkv99qKVZJsZIfP7phknv
         ReNg==
X-Forwarded-Encrypted: i=1; AJvYcCW1MqBEwjFHX1BA4Mwi5rvl1c8mwO7CP00fQlKcHRpeF5LKmIxsjT09CKCLyOOPTn0HHK17Q/5L7pTi7g==@lists.linaro.org
X-Gm-Message-State: AOJu0YxjJ7gvqbAozHvuB9afommjD+Z8/1T/lmWQiGE1jg4zAaS4/9uh
	D35eTnlTGNjVHroO33aTZJ8Z0fkoxWGuZSf8Sn0IqmPR7f0HbZK4Jqqdz0Ymt+07nw==
X-Gm-Gg: ATEYQzwjdmYcgsD/WxrrifkJWn8qIlBpwp+pjpyRMp4Qygt7yp9l97cO0QvujN657wI
	pxn/vnTh27/K3uType4/L0KBe45WhPrDLQATTug/nNx73NzzWlM+hmEXUuaao37wtdFx7dcobZj
	sF6Z5+Cil7qQ9+8Tnumiz5thDCc4CMxUUMTvLx7VFq0ubgMWPqyIyU1qyLDJATLUIJPcPiYyRIp
	+Z8ixItie1oMk9sqbzo0VKl/elAHK7Xu7hH2BafmxHqFALFZzBf1Cn4TyHcMCVB+cgZfobXFMhS
	bfKE/nbtTD0rw6d09Ihly3nLDNbbbSebsotmFV2jwu2y6E/HvZYc8J6QLYoBriT9+LE0ambvH0u
	/E/EG718UMTZ1o3lYgKKWu38/mP3TghvaMGH61Yk/BAQoeQBkv0qtTOm6fPlABPiVSRuIpkNgrh
	Fi9i4WyO3vus5G7MP2EV6zYGd3sMrMy9a9iIF55UNVrmMS+xMXAi9oZn2n2ysSasiX4FMmHx0Bj
	Q==
X-Received: by 2002:a05:6a21:514:b0:387:dfb3:cd0a with SMTP id adf61e73a8af0-395c3b4e266mr15236439637.63.1772519137271;
        Mon, 02 Mar 2026 22:25:37 -0800 (PST)
Received: from ?IPV6:2401:4900:8fef:99f2:f3b:1675:33cc:545a? ([2401:4900:8fef:99f2:f3b:1675:33cc:545a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3abb8dsm1147875a91.15.2026.03.02.22.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 22:25:36 -0800 (PST)
Message-ID: <f0b9f2d1-ffa8-4c22-b3be-8efde446dadf@beagleboard.org>
Date: Tue, 3 Mar 2026 11:55:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, linux-devel@silabs.com,
 Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>
References: <ecca8eb2-8e5a-4770-bcf6-3fb49773088b@beagleboard.org>
 <DGSMSOPS3RG0.3417SB071FTNC@silabs.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <DGSMSOPS3RG0.3417SB071FTNC@silabs.com>
X-Spamd-Bar: ---
Message-ID-Hash: UBQFTO4ASSERNQ6A55NWFUPIFM7B73EQ
X-Message-ID-Hash: UBQFTO4ASSERNQ6A55NWFUPIFM7B73EQ
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC] greybus: support combined Host + SVC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UBQFTO4ASSERNQ6A55NWFUPIFM7B73EQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
X-Rspamd-Queue-Id: 531201E9979
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	FROM_NEQ_ENVFROM(0.00)[ayush@beagleboard.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Action: no action

T24gMy8zLzI2IDM6MjcgQU0sIERhbWllbiBSacOpZ2VsIHdyb3RlOg0KDQo+IE9uIFNhdCBGZWIg
MjgsIDIwMjYgYXQgODo0NyBBTSBFU1QsIEF5dXNoIFNpbmdoIHdyb3RlOg0KPj4gMi4gU1ZDIHBl
ciBub2RlDQo+Pg0KPj4gICAgICBFYWNoIG5vZGUgaW1wbGVtZW50cyBpdHMgb3duIFNWQy4gU2lu
Y2UgYW4gScKyQyBzbGF2ZSBjYW5ub3QgaW5pdGlhdGUNCj4+IGNvbW11bmljYXRpb24sIHRoZSBB
UCBtdXN0IGFscmVhZHkga25vdyB0aGUgYWRkcmVzcyBvZiBlYWNoIFNWQy9tb2R1bGUuDQo+PiBU
aGlzIGFsc28gc2VlbXMgaW5lZmZpY2llbnQgd2hlbiBjaGFpbmluZyBtdWx0aXBsZSBub2Rlcy4N
Cj4+DQo+PiBbLi4uXQ0KPj4NCj4+IDMuIFNWQy9CcmlkZ2UgZnVuY3Rpb25hbGl0eSBpbnNpZGUg
dGhlIEFQDQo+Pg0KPj4gICAgICBGb3IgdGhpcyB1c2UgY2FzZSwgdGhpcyBzZWVtcyB0byBiZSB0
aGUgbW9zdCBwcmFjdGljYWwgb3B0aW9uLg0KPj4NCj4+ICAgICAgVG8gY2xhcmlmeSwgSSBhbSBu
b3QgcHJvcG9zaW5nIGFueSBuZXcgZGF0YSBwYXRocyBpbiB0aGUgR3JleWJ1cw0KPj4gcGlwZWxp
bmUuIFRoZSBpZGVhIGlzIHRvIGhhdmUgYSByZXVzYWJsZSBhbiBTVkMvYnJpZGdlIGltcGxlbWVu
dGF0aW9uDQo+PiBzaW1pbGFyIHRvIHdoYXQgZXhpc3RzIGluIGdyZXlidXMtemVwaHlyIFsyXVsz
XSwgYnV0IGhvc3RlZCB3aXRoaW4gdGhlIEFQLg0KPiBXZSBkaXNjdXNzZWQgaW50ZXJuYWxseSBh
dCBTaWxpY29uIExhYnMgb2YgdGhpcyBzb2x1dGlvbiB0byBnZXQgcmlkIG9mDQo+IHRoZSBTVkMg
b24gdGhlIGRldmljZSBidXQgaGF2ZW4ndCBhY3R1YWxseSBpbXBsZW1lbnRlZCBpdCwgZ29vZCB0
byBrbm93DQo+IHRoYXQgd2Ugd2VyZSBub3QgYWxvbmUuIEkgdGhpbmsgaXQncyBhIGdyZWF0IGF2
ZW51ZSB0byBleHBsb3JlIGJlY2F1c2UNCj4gaXQga2VlcHMgZXhpc3RpbmcgU1ZDIGNvZGUgYXMg
aXMsIHNvIHdlIGtlZXAgYSBzaW5nbGUgZGF0YSBwYXRoIGluDQo+IEdyZXlidXMnIGNvcmUgd2hp
bGUgb2ZmZXJpbmcgdGhlIGNhcGFiaWxpdHkgdG8gaGFuZGxlIFNWQyByZXF1ZXN0cyBvbg0KPiB0
aGUgaG9zdC4NCj4NCj4gSnVzdCB0byBoZWxwIG1lIGdldCBhIGJldHRlciBtZW50YWwgcGljdHVy
ZSwgaW4gaGQtPm1lc3NhZ2Vfc2VuZCB5b3UNCj4gd291bGQgZWl0aGVyIGhhbmRsZSB0aGUgbWVz
c2FnZSBpbW1lZGlhdGVseSBpZiBjcG9ydF9pZCA9PSAwLCBvciBjb252ZXJ0DQo+IHRoYXQgY3Bv
cnRfaWQgdG8gYW4gKGludGVyZmFjZSwgaW50Zl9jcG9ydF9pZCkgYW5kIHBhc3MgdGhlIG1lc3Nh
Z2UgdG8NCj4gdGhhdCBpbnRlcmZhY2UncyBjcG9ydCwgc29tZXRoaW5nIGxpa2UgdGhhdD8NCj4N
Cj4gICAgICBzdGF0aWMgaW50IG1lc3NhZ2Vfc2VuZCguLi4sIHUxNiBjcG9ydF9pZCwgc3RydWN0
IGdiX21lc3NhZ2UgKm1zZywgLi4uKQ0KPiAgICAgIHsNCj4gICAgICAJaWYgKGNwb3J0X2lkID09
IEdCX1NWQ19DUE9SVF9JRCkgew0KPiAgICAgIAkJcmV0dXJuIHN2Y19icmlkZ2VfaGFuZGxlX21z
Zyhtc2cpOw0KPiAgICAgIAl9IGVsc2Ugew0KPiAgICAgIAkJc3RydWN0IGNvbm5lY3Rpb24gKmNv
bm5lY3Rpb24gPSBzdmNfYnJpZGdlX2dldF9jb25uZWN0aW9uKGNwb3J0X2lkKTsNCj4gICAgICAJ
CS8vIC4uLiBvciB5b3UgY291bGQgZGlyZWN0bHkgbG9vayB1cCBpbiBoZC0+Y29ubmVjdGlvbnMs
DQo+ICAgICAgCQkvLyB0aGUgd2hvbGUgbGlzdCBvZiBjb25uZWN0aW9ucyBpcyBhbHJlYWR5IHRo
ZXJlLCBzbw0KPiAJCS8vIG5vIG5lZWQgdG8gbWFpbnRhaW4gYW5vdGhlciBvbmUgc2VwYXJhdGVs
eQ0KPg0KPiAgICAgIAkJLy8gc29tZXdob3cgY29udmVydCBjb25uZWN0aW9uLT5pbnRmIHRvIGFu
IGkyYyBhZGRyZXNzDQo+ICAgICAgCQkvLyBhbmQgdXNlIGNvbm5lY3Rpb24tPmludGZfY3BvcnRf
aWQgdG8gYWRkcmVzcyB0aGUgY3BvcnQNCj4gICAgICAJCWkyY190cmFuc2ZlcihhZGFwLCBtc2dz
LCAxKTsNCj4gICAgICAJfQ0KPiAgICAgIH0NCg0KWWVzLCB0aGF0J3MgdGhlIGJhc2ljIGlkZWEu
IFRoZSBBUElzIHdpbGwgcHJvYmFibHkgbG9vayBhIGJpdCBkaWZmZXJlbnQsIA0KYnV0IGxldCBt
ZSBzZWUgaG93IG11Y2ggaW5mbyBsaW51eCBncmV5YnVzIG1vZHVsZSBhbHJlYWR5IGhhcy4NCg0K
Pj4gICAgICBgYGANCj4+ICAgICAgICAgICstLS0tLS0tLS0tLS0tKyAgICAgICAgICAgICAgICAr
LS0tLS0tLS0tLS0rDQo+PiAgICAgICAgICB8IEFQIC8gU1ZDICAgIHwgPC0tLSBJMkMgLS0tPsKg
IHwgTW9kdWxlICAgIHwNCj4+ICAgICAgICAgICstLS0tLS0tLS0tLS0tKyAgICAgICAgICAgICAg
ICArLS0tLS0tLS0tLS0rDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfMKgICAg
ICAgICAgICAgKy0tLS0tLS0tLS0rDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGAtLSBJMkMgLS0tPsKgIHwgTW9kdWxlICB8DQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0rDQo+PiAg
ICAgIGBgYA0KPiBZb3UgbWVudGlvbiBpbiBwb2ludCAyIHRoYXQgaTJjIHNsYXZlcyBjYW5ub3Qg
aW5pdGlhdGUgY29tbXVuaWNhdGlvbiwgc28NCj4gSSB3b25kZXIgaG93IHlvdSB3b3VsZCBlbXVs
YXRlIHRoZSAiTU9EVUxFX0lOU0VSVEVEIiB0aGF0IGZsb3dzIGZyb20gU1ZDDQo+IHRvIHRoZSBB
UC4gV291bGQgeW91ciBIRCBwb2xsIHRoZSBidXMgZm9yIGNvbm5lY3RlZCBtb2R1bGVzIGFuZCAi
c2VuZCIgYQ0KPiBNT0RVTEVfSU5TRVJURUQgZm9yIGVhY2ggb2YgdGhlbT8NCj4NCj4gQmVzaWRl
cyB0aGF0LCBJIHRoaW5rIGl0IHdvdWxkIHdvcmsgZmluZS4gSSdsbCBiZSBoYXBweSB0byB0ZXN0
IGFuZA0KPiByZXZpZXcgeW91ciBwYXRjaCB3aGVuIHJlYWR5Lg0KPg0KPiBSZWdhcmRzLA0KPiBk
YW1pZW4NCg0KDQpJIGFtIGN1cnJlbnRseSB0aGlua2luZyBvZiBoYXZpbmcgYSBkZWJ1Z2ZzIGVu
dHJ5IHRvIG1hbnVhbGx5IGFkZCBhbmQgDQpyZW1vdmUgbW9kdWxlcyBmb3IgdGhlIGRlbW8gSSBh
bSB3b3JraW5nIG9uLiBHZW5lcmFsbHksIEkgd291bGQgcHJlZmVyIA0Kbm90IGRvaW5nIGNvbnRp
bnVvdXMgcG9sbGluZyBvbiBsaW51eC4gQnV0IEkgYW0gdGhpbmtpbmcgb2YgZG9pbmcgdGhlIA0K
cG9sbGluZyBiYXNlZCBkaXNjb3Zlcnkgb24gdGhlIGRyaXZlciBwcm9iZS4NCg0KDQpCZXN0IFJl
Z2FyZHMsDQoNCkF5dXNoIFNpbmdoDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1k
ZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
