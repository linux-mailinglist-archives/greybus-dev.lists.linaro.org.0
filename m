Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKT3LJdMx2kBVQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Mar 2026 04:35:51 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3534D2E5
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Mar 2026 04:35:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BBAC43F7EE
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Mar 2026 03:35:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	by lists.linaro.org (Postfix) with ESMTPS id 731B53F6F0
	for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2026 03:35:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=2xa8Xba1;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none);
	spf=neutral (lists.linaro.org: 209.85.214.170 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b0c8362d93so14217485ad.3
        for <greybus-dev@lists.linaro.org>; Fri, 27 Mar 2026 20:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1774668944; x=1775273744; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWna6sVKl32nDxZHzGV9KUgrpYbWwTlBdvFmTQfz2NU=;
        b=2xa8Xba17RHZpxDRxDxvWAjwjKSKs1L2s5ik9FYXVnYIVBHjYrnVWrzVipc6Inb9fz
         NmQ9kgU/TI7J29xSJ4pDdf+WfrrRfUVcTpiDgEHux3LpopVva3neSbszZpBd5cwKb351
         yy+49NEqOVIOa3c55PsDfwoXFjjH9ghOBQzjcHz7wsDIyeDf9sa08FYIklf0KUjHyYDr
         iGDTfMooaIac8r7o0yUzL1BwLOuY3kPWPrZ88cND2LjqyOXKBn3ZC8jz9a9i15CXTUiz
         ZL2BRHG18PnvA7VIjRyF4Us50rGmjZjCqYAhaHFoRYOgD0esCeckZ1P2w65oByIHnBZs
         hpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774668944; x=1775273744;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWna6sVKl32nDxZHzGV9KUgrpYbWwTlBdvFmTQfz2NU=;
        b=fpVOBINRvnhUUq3i+g4UGFSLeDmI3YuiK0YrVoIFu19M2cbthhJSVWntJ2k4NuyLgs
         24JUeVychTrfoipjtzFLtwsRUYASWLTj3USd5Gp4bhtpSP3nQKdpLaXw3TQOnH9NR+bP
         E8MaQtECrTayx7dbp9OYMJDxuBGcehxonL5hAIZFZ4agmpWdOJWRfvWl76zBEXoWIdU4
         g1AKZfbw0c2O6d4S2jCqNV6hRG0k2CwUB3o9neVf2oZApb5QGxiOn+KQJ/o7RRLKMNbc
         MqJuMziiotJ0tjy5KgaxQ5Clj5jb3YlrJ85oDJGGXz5Qpg7evXvF8FlI0b+CZkeOL7Ye
         VDBA==
X-Forwarded-Encrypted: i=1; AJvYcCXf1ZwBn/h+ozMJ1BD2+7mjIhdA1Q9OOot+PLl8DWcIcCd7Xl0j9YuQuSuqnc7qV3D3sGfCLtC+SMj9gA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwoUxRfH7cUI3OGZfrP5u9N+8NCH5KF39Rf2EAUM1VelO5xpptt
	+YooZhnMvZOorrOOi2L/6MoIrydkcdM4Hz7fXkulJO0VXbWB1hv+KENjXvvPTDfjMQ==
X-Gm-Gg: ATEYQzzev9h/y/xLlm5X2cGZW46epdqy7CF/emEf1fIA4EqQoFXTscPBVJP0zPkgn5A
	cS0K8Bh2xTwkrsx7Ar0egikjh6ZL/ZkZnfoBGYQEHpR+H/ioGV6vO8PIO7+D/+D0FrbJ+oPRTfK
	CKdpxLtK5gVhbN1tbVxQQn0P6BLwbC9xFEGbwXehhQikKJcdgvr0EYeejdo7fFtThny9TmDWpUC
	HLGVbZ64LzgGnM9hy+gRnB5gPti0bh6sZor65cgkTJQKiOlg87kuoCT4T8sGNEeb29Z3Bdo52Qd
	QP3EBhqpNXNi/QGt6ENizv7zC01lulkHZKSk3C/yxb3kXDuITFM3FOJTC5XJl8TtBwpcnO5PfMP
	NiFrJ0qOsQaqALfzpcUhHdZXjAqFZ2QzCtcfPOgn3bsigg3yAc+vwnZgUbUD78qMmd4GpHIv4LU
	QsfpkQ/f5zQseSOLUvPiQXADpw0U4sUeqforbHE03s8jzhOL53XfSnrfClpNwItU5Hg3dSA8yvU
	Tzy/BXnYqiT
X-Received: by 2002:a17:902:f650:b0:2b0:65e8:4041 with SMTP id d9443c01a7336-2b0cdcb73e2mr52668905ad.36.1774668944507;
        Fri, 27 Mar 2026 20:35:44 -0700 (PDT)
Received: from ?IPV6:2401:4900:8fec:e3ec:5a4:f3f9:d03a:d2e3? ([2401:4900:8fec:e3ec:5a4:f3f9:d03a:d2e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264286fsm8543415ad.14.2026.03.27.20.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 20:35:44 -0700 (PDT)
Message-ID: <10112f89-fbfd-4f1c-afe3-b68e56c9ba2c@beagleboard.org>
Date: Sat, 28 Mar 2026 09:05:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ayush Singh <ayush@beagleboard.org>
To: =?UTF-8?Q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, linux-devel@silabs.com,
 Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>
References: <ecca8eb2-8e5a-4770-bcf6-3fb49773088b@beagleboard.org>
 <DGSMSOPS3RG0.3417SB071FTNC@silabs.com>
 <f0b9f2d1-ffa8-4c22-b3be-8efde446dadf@beagleboard.org>
Content-Language: en-US
In-Reply-To: <f0b9f2d1-ffa8-4c22-b3be-8efde446dadf@beagleboard.org>
X-Spamd-Bar: ---
Message-ID-Hash: 37EKFZB3C76XVPRRDUEHQTNOD6AOEUSY
X-Message-ID-Hash: 37EKFZB3C76XVPRRDUEHQTNOD6AOEUSY
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC] greybus: support combined Host + SVC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/37EKFZB3C76XVPRRDUEHQTNOD6AOEUSY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
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
	NEURAL_HAM(-0.00)[-0.647];
	FROM_NEQ_ENVFROM(0.00)[ayush@beagleboard.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 2AB3534D2E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8zLzI2IDExOjU1IEFNLCBBeXVzaCBTaW5naCB3cm90ZToNCg0KPiBPbiAzLzMvMjYgMzoy
NyBBTSwgRGFtaWVuIFJpw6lnZWwgd3JvdGU6DQo+DQo+PiBPbiBTYXQgRmViIDI4LCAyMDI2IGF0
IDg6NDcgQU0gRVNULCBBeXVzaCBTaW5naCB3cm90ZToNCj4+PiAyLiBTVkMgcGVyIG5vZGUNCj4+
Pg0KPj4+IMKgwqDCoMKgIEVhY2ggbm9kZSBpbXBsZW1lbnRzIGl0cyBvd24gU1ZDLiBTaW5jZSBh
biBJwrJDIHNsYXZlIGNhbm5vdCANCj4+PiBpbml0aWF0ZQ0KPj4+IGNvbW11bmljYXRpb24sIHRo
ZSBBUCBtdXN0IGFscmVhZHkga25vdyB0aGUgYWRkcmVzcyBvZiBlYWNoIFNWQy9tb2R1bGUuDQo+
Pj4gVGhpcyBhbHNvIHNlZW1zIGluZWZmaWNpZW50IHdoZW4gY2hhaW5pbmcgbXVsdGlwbGUgbm9k
ZXMuDQo+Pj4NCj4+PiBbLi4uXQ0KPj4+DQo+Pj4gMy4gU1ZDL0JyaWRnZSBmdW5jdGlvbmFsaXR5
IGluc2lkZSB0aGUgQVANCj4+Pg0KPj4+IMKgwqDCoMKgIEZvciB0aGlzIHVzZSBjYXNlLCB0aGlz
IHNlZW1zIHRvIGJlIHRoZSBtb3N0IHByYWN0aWNhbCBvcHRpb24uDQo+Pj4NCj4+PiDCoMKgwqDC
oCBUbyBjbGFyaWZ5LCBJIGFtIG5vdCBwcm9wb3NpbmcgYW55IG5ldyBkYXRhIHBhdGhzIGluIHRo
ZSBHcmV5YnVzDQo+Pj4gcGlwZWxpbmUuIFRoZSBpZGVhIGlzIHRvIGhhdmUgYSByZXVzYWJsZSBh
biBTVkMvYnJpZGdlIGltcGxlbWVudGF0aW9uDQo+Pj4gc2ltaWxhciB0byB3aGF0IGV4aXN0cyBp
biBncmV5YnVzLXplcGh5ciBbMl1bM10sIGJ1dCBob3N0ZWQgd2l0aGluIA0KPj4+IHRoZSBBUC4N
Cj4+IFdlIGRpc2N1c3NlZCBpbnRlcm5hbGx5IGF0IFNpbGljb24gTGFicyBvZiB0aGlzIHNvbHV0
aW9uIHRvIGdldCByaWQgb2YNCj4+IHRoZSBTVkMgb24gdGhlIGRldmljZSBidXQgaGF2ZW4ndCBh
Y3R1YWxseSBpbXBsZW1lbnRlZCBpdCwgZ29vZCB0byBrbm93DQo+PiB0aGF0IHdlIHdlcmUgbm90
IGFsb25lLiBJIHRoaW5rIGl0J3MgYSBncmVhdCBhdmVudWUgdG8gZXhwbG9yZSBiZWNhdXNlDQo+
PiBpdCBrZWVwcyBleGlzdGluZyBTVkMgY29kZSBhcyBpcywgc28gd2Uga2VlcCBhIHNpbmdsZSBk
YXRhIHBhdGggaW4NCj4+IEdyZXlidXMnIGNvcmUgd2hpbGUgb2ZmZXJpbmcgdGhlIGNhcGFiaWxp
dHkgdG8gaGFuZGxlIFNWQyByZXF1ZXN0cyBvbg0KPj4gdGhlIGhvc3QuDQo+Pg0KPj4gSnVzdCB0
byBoZWxwIG1lIGdldCBhIGJldHRlciBtZW50YWwgcGljdHVyZSwgaW4gaGQtPm1lc3NhZ2Vfc2Vu
ZCB5b3UNCj4+IHdvdWxkIGVpdGhlciBoYW5kbGUgdGhlIG1lc3NhZ2UgaW1tZWRpYXRlbHkgaWYg
Y3BvcnRfaWQgPT0gMCwgb3IgY29udmVydA0KPj4gdGhhdCBjcG9ydF9pZCB0byBhbiAoaW50ZXJm
YWNlLCBpbnRmX2Nwb3J0X2lkKSBhbmQgcGFzcyB0aGUgbWVzc2FnZSB0bw0KPj4gdGhhdCBpbnRl
cmZhY2UncyBjcG9ydCwgc29tZXRoaW5nIGxpa2UgdGhhdD8NCj4+DQo+PiDCoMKgwqDCoCBzdGF0
aWMgaW50IG1lc3NhZ2Vfc2VuZCguLi4sIHUxNiBjcG9ydF9pZCwgc3RydWN0IGdiX21lc3NhZ2Ug
DQo+PiAqbXNnLCAuLi4pDQo+PiDCoMKgwqDCoCB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIChj
cG9ydF9pZCA9PSBHQl9TVkNfQ1BPUlRfSUQpIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gc3ZjX2JyaWRnZV9oYW5kbGVfbXNnKG1zZyk7DQo+PiDCoMKgwqDCoMKgwqDCoMKg
IH0gZWxzZSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGNvbm5lY3Rpb24g
KmNvbm5lY3Rpb24gPSANCj4+IHN2Y19icmlkZ2VfZ2V0X2Nvbm5lY3Rpb24oY3BvcnRfaWQpOw0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIC4uLiBvciB5b3UgY291bGQgZGlyZWN0bHkg
bG9vayB1cCBpbiBoZC0+Y29ubmVjdGlvbnMsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ly8gdGhlIHdob2xlIGxpc3Qgb2YgY29ubmVjdGlvbnMgaXMgYWxyZWFkeSB0aGVyZSwgc28NCj4+
IMKgwqDCoMKgwqDCoMKgIC8vIG5vIG5lZWQgdG8gbWFpbnRhaW4gYW5vdGhlciBvbmUgc2VwYXJh
dGVseQ0KPj4NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBzb21ld2hvdyBjb252ZXJ0
IGNvbm5lY3Rpb24tPmludGYgdG8gYW4gaTJjIGFkZHJlc3MNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvLyBhbmQgdXNlIGNvbm5lY3Rpb24tPmludGZfY3BvcnRfaWQgdG8gYWRkcmVzcyB0
aGUgY3BvcnQNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpMmNfdHJhbnNmZXIoYWRhcCwg
bXNncywgMSk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+IMKgwqDCoMKgIH0NCj4NCj4gWWVz
LCB0aGF0J3MgdGhlIGJhc2ljIGlkZWEuIFRoZSBBUElzIHdpbGwgcHJvYmFibHkgbG9vayBhIGJp
dCANCj4gZGlmZmVyZW50LCBidXQgbGV0IG1lIHNlZSBob3cgbXVjaCBpbmZvIGxpbnV4IGdyZXli
dXMgbW9kdWxlIGFscmVhZHkgaGFzLg0KPg0KPj4+IMKgwqDCoMKgIGBgYA0KPj4+IMKgwqDCoMKg
wqDCoMKgwqAgKy0tLS0tLS0tLS0tLS0rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICst
LS0tLS0tLS0tLSsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIHwgQVAgLyBTVkPCoMKgwqAgfCA8LS0t
IEkyQyAtLS0+wqAgfCBNb2R1bGXCoMKgwqAgfA0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgKy0tLS0t
LS0tLS0tLS0rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICstLS0tLS0tLS0tLSsNCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCArLS0tLS0tLS0tLSsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBgLS0gSTJDIC0tLT7C
oCB8IE1vZHVsZcKgIHwNCj4+PiArLS0tLS0tLS0tLSsNCj4+PiDCoMKgwqDCoCBgYGANCj4+IFlv
dSBtZW50aW9uIGluIHBvaW50IDIgdGhhdCBpMmMgc2xhdmVzIGNhbm5vdCBpbml0aWF0ZSBjb21t
dW5pY2F0aW9uLCBzbw0KPj4gSSB3b25kZXIgaG93IHlvdSB3b3VsZCBlbXVsYXRlIHRoZSAiTU9E
VUxFX0lOU0VSVEVEIiB0aGF0IGZsb3dzIGZyb20gU1ZDDQo+PiB0byB0aGUgQVAuIFdvdWxkIHlv
dXIgSEQgcG9sbCB0aGUgYnVzIGZvciBjb25uZWN0ZWQgbW9kdWxlcyBhbmQgInNlbmQiIGENCj4+
IE1PRFVMRV9JTlNFUlRFRCBmb3IgZWFjaCBvZiB0aGVtPw0KPj4NCj4+IEJlc2lkZXMgdGhhdCwg
SSB0aGluayBpdCB3b3VsZCB3b3JrIGZpbmUuIEknbGwgYmUgaGFwcHkgdG8gdGVzdCBhbmQNCj4+
IHJldmlldyB5b3VyIHBhdGNoIHdoZW4gcmVhZHkuDQo+Pg0KPj4gUmVnYXJkcywNCj4+IGRhbWll
bg0KPg0KPg0KPiBJIGFtIGN1cnJlbnRseSB0aGlua2luZyBvZiBoYXZpbmcgYSBkZWJ1Z2ZzIGVu
dHJ5IHRvIG1hbnVhbGx5IGFkZCBhbmQgDQo+IHJlbW92ZSBtb2R1bGVzIGZvciB0aGUgZGVtbyBJ
IGFtIHdvcmtpbmcgb24uIEdlbmVyYWxseSwgSSB3b3VsZCBwcmVmZXIgDQo+IG5vdCBkb2luZyBj
b250aW51b3VzIHBvbGxpbmcgb24gbGludXguIEJ1dCBJIGFtIHRoaW5raW5nIG9mIGRvaW5nIHRo
ZSANCj4gcG9sbGluZyBiYXNlZCBkaXNjb3Zlcnkgb24gdGhlIGRyaXZlciBwcm9iZS4NCj4NCj4N
Cj4gQmVzdCBSZWdhcmRzLA0KPg0KPiBBeXVzaCBTaW5naA0KDQoNCkkgZG8gaGF2ZSBhIHdvcmtp
bmcgU1ZDIGtlcm5lbCBtb2R1bGUgbm93IFswXS4gTmVlZCB0byBicnVzaCB1cCBzb21lIA0KdGhp
bmdzIG9uIEkyQyB0cmFuc3BvcnQgc2lkZSwgYnV0IHRoZSBzdmMgbm9kZSBjb2RlIHNlZW1zIHRv
IGJlIGluIGdvb2QgDQpzdGF0ZS4gVGVzdGVkIHdpdGggQmVhZ2xlQ29ubmVjdCBGcmVlZG9tIHJ1
bm5pbmcgR3JleWJ1cy1aZXBoeXIgb3ZlciBJMkMuDQoNCg0KQmVzdCBSZWdhcmRzLA0KDQpBeXVz
aCBTaW5naA0KDQoNClswXTogDQpodHRwczovL2dpdGh1Yi5jb20vQXl1c2gxMzI1L2xpbnV4L2Js
b2IvYjQvZ2ItaTJjLXRyYW5zcG9ydC9kcml2ZXJzL2dyZXlidXMvc3ZjX25vZGUuYw0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmli
ZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
