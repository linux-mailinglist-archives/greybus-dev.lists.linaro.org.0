Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAteLf/xomky8QQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Feb 2026 14:47:43 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BE91C34F4
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Feb 2026 14:47:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DCE3744786
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Feb 2026 13:47:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id ABE8C401B2
	for <greybus-dev@lists.linaro.org>; Sat, 28 Feb 2026 13:47:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=F+XBYFdv;
	spf=neutral (lists.linaro.org: 209.85.214.169 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aaed195901so15077645ad.0
        for <greybus-dev@lists.linaro.org>; Sat, 28 Feb 2026 05:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1772286459; x=1772891259; darn=lists.linaro.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+Yis15s/y6ACMzRa532TWtng35Hri3uK4UVjGLrFck=;
        b=F+XBYFdvbx/gD/gLF35UyCoeK0GYjvRJcBMv0X1f7nNjCuFDFozrCQ2JcpiMBEcjb1
         bw1oZ4xoKooXvE4wsFerRS+ifwdeMc3cIu9VztrgMn666hCgOsrnNQNj0m7CNNIpG9oR
         wdujFDktWijqzF/d5px26c27RhfdoGSR3mPc1Z7SE3/7ytZXdCkX3TwbvM+xGdreziLD
         8Tli6iN1BFJ3o3LqwQghiv4oSGp2EfKJb4QwEfsMoJHb5KyUILwAQRCeNVzONLT/SsmB
         8f33RnLqNvUalPeYNXxxBlDIlb7Ofam8/74LYb6KoA3K2oUEznU+A+kw1MF0s4cAlf1S
         T1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772286459; x=1772891259;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+Yis15s/y6ACMzRa532TWtng35Hri3uK4UVjGLrFck=;
        b=CN0Ognp0chIQsA0BdA/wMgDwrHQ/mGpRCnmbLaqRvFAfiv8MrAryc9yKdhosn3K8Ru
         4nPbnfiwbGodfiPBCQSDiFL1RYtPMqG4dp9LCMZ2WiTteG8fdfaEJd1gTNko4fLu1+s9
         yXGX3Fj5BD9+BPbok0pgKRznDqWMlGYfiatnzHAsh827Emdj0+Rh3jWPi5lBrWBD4lot
         7YH3vasm5q4/wh2S3D7GFZL8nbQcae5Va5o6XRtMR7gjEVzcZNW4pJQnneqOIXogYkih
         ck+ifv5T59SCuRkoJTkMrZqSCs86ey2y2x/HmLYr3YQflMjIR9DwIJ9GiJyDeKDfmj6w
         sxKQ==
X-Gm-Message-State: AOJu0YxqAVOYxZE19jQdjUmy/bL+ELJ0apvIWJwKA1CGr/bzb4g4DDBY
	LPiaekB0mbhNCxdoV9jMOPBg4g5QXp7Q2NuF2TrTfIQ+Xq7ANvRYXPoPuznYz6JSdL1OgcnfsNA
	S7E8=
X-Gm-Gg: ATEYQzw6CKF89A02znOIf+su3llUN8+8LRgVRwXt/H9r+/k/VCpgFJEcyxWj6IL+cK6
	fq1pzVmJ3QZvT6zriE3L2Vk4x1knwzftsp3urisgEkvUBAmqnkJjOgQBCP+o88Mzdd36oBEeJBx
	7aZJ09nKHq6/6kbtN06AN/UZKq6g79fVa2S7keavbAPZmdIPFimRhNSghEdUCJo48psxUj6fI3k
	4sC8uSHULl/jfCWpH+lziC1r3GdLK57EqkrBBz7Q5jeZuPciBGrETRShfnvvErLxoT0Itc/SP0v
	QkPQ7uKNKynS0JZo+s/PKMITpZ5tV+1r3bO+PJS41XoGP3OZj/ej5+KAYR+tvqE5McDj/2o8mcK
	0GVVyzZ8LZZMPTfnVHxVWn2TbQ9K2ukBZuT3m31RJm5PgLg002YZtSOI6R545/A4jFa2kKrceON
	rNmN5HUMQYuSeCpbnhXe06rNPeZsZFBskcgNphEECSn64xPBS1snKoHsss4R5Qgmh+qorAqIto4
	Fl4
X-Received: by 2002:a17:903:240a:b0:2ad:a315:286e with SMTP id d9443c01a7336-2ae2e4d0acdmr64248225ad.43.1772286458597;
        Sat, 28 Feb 2026 05:47:38 -0800 (PST)
Received: from ?IPV6:2401:4900:8fef:5983:4a73:2ed6:99d3:f043? ([2401:4900:8fef:5983:4a73:2ed6:99d3:f043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm18109575ad.6.2026.02.28.05.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 05:47:38 -0800 (PST)
Message-ID: <ecca8eb2-8e5a-4770-bcf6-3fb49773088b@beagleboard.org>
Date: Sat, 28 Feb 2026 19:17:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, linux-devel@silabs.com,
 Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>
From: Ayush Singh <ayush@beagleboard.org>
X-Spamd-Bar: /
Message-ID-Hash: 5BHWUET6X5HPXDH2U2OYEDBMVN6CHBWJ
X-Message-ID-Hash: 5BHWUET6X5HPXDH2U2OYEDBMVN6CHBWJ
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC] greybus: support combined Host + SVC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5BHWUET6X5HPXDH2U2OYEDBMVN6CHBWJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
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
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ayush@beagleboard.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sparkfun.com:url]
X-Rspamd-Queue-Id: 37BE91C34F4
X-Rspamd-Action: no action

SGVsbG8gZXZlcnlvbmUsDQoNCknigJl2ZSByZWNlbnRseSBiZWVuIGV4cGVyaW1lbnRpbmcgd2l0
aCBjaGFpbmluZyBtdWx0aXBsZSBHcmV5YnVzIG5vZGVzIHRvIA0KYSBzaW5nbGUgaG9zdCBvdmVy
IEnCskMgKFFXSUlDIHBvcnQgWzBdKS4gVGhpcyBnZW5lcmFsIGlkZWEgaXMgbm90IG5ldyANCihz
ZWUgTWljcm9Nb2QgUXdpaWMgUHJvIEtpdCBbMV0pLCBhbHRob3VnaCB0aG9zZSBzZXR1cHMgZG8g
bm90IHVzZSBHcmV5YnVzLg0KDQpTaW5jZSBJwrJDIGRvZXMgbm90IGFsbG93IGEgc2xhdmUgdG8g
aW5pdGlhdGUgdHJhbnNmZXJzLCBpdCBpcyBub3Qgd2VsbCANCnN1aXRlZCBmb3Igbm9kZS1pbml0
aWF0ZWQgZXZlbnRzIChlLmcuIGludGVycnVwdHMsIFNWQy1pbml0aWF0ZWQgDQpjb250cm9sKS4g
SG93ZXZlciwgZm9yIG15IGN1cnJlbnQgdXNlIGNhc2UgSSBhbSBwcmltYXJpbHkgaW50ZXJlc3Rl
ZCBpbiANCnBvbGxpbmctYmFzZWQgZnVuY3Rpb25hbGl0eSwgc28gdGhpcyBsaW1pdGF0aW9uIGlz
IGFjY2VwdGFibGUuDQoNCkluIGEgdHlwaWNhbCBHcmV5YnVzIHRvcG9sb2d5LCBhbiBBcHBsaWNh
dGlvbiBQcm9jZXNzb3IgKEFQKSwgYW4gU1ZDLCANCmFuZCBvbmUgb3IgbW9yZSBtb2R1bGVzIGFy
ZSBjb25uZWN0ZWQgdmlhIFVuaVByby4gSW4gcHJhY3RpY2UsIGJlY2F1c2UgDQptb3N0IGFwcGxp
Y2F0aW9uIHByb2Nlc3NvcnMgbGFjayBhIG5hdGl2ZSBVbmlQcm8gaW50ZXJmYWNlLCB0aGV5IGNv
bm5lY3QgDQp0aHJvdWdoIGEgYnJpZGdlIGRldmljZSB0aGF0IGFsc28gaW1wbGVtZW50cyB0aGUg
U1ZDLg0KDQpGb3IgdGhlIEnCskMtYmFzZWQgc2V0dXAgZGVzY3JpYmVkIGFib3ZlLCBJIGhhdmUg
Y29uc2lkZXJlZCB0aGUgZm9sbG93aW5nIA0KdG9wb2xvZ2llczoNCg0KMS4gU2VwYXJhdGUgY28t
cHJvY2Vzc29yIChTVkMvQnJpZGdlKQ0KDQogwqAgwqBUaGlzIGFwcHJvYWNoIGlzIHJlYXNvbmFi
bGUgb24gU29DcyBzdWNoIGFzIFRJIEFNNjI1NCwgd2hpY2ggaW5jbHVkZSANCmFuIE00RiBjb3Jl
IHRoYXQgY2FuIHNlcnZlIGFzIHRoZSBTVkMvYnJpZGdlIGFuZCBjb250cm9sIHRoZSBJwrJDIGJ1
cy4gDQpIb3dldmVyLCBvbiBkZXZpY2VzIGxpa2UgVEkgQU02MkwsIHdoaWNoIGxhY2sgc3VjaCBh
IGNvcmUsIGludHJvZHVjaW5nIA0KYW4gYWRkaXRpb25hbCBwcm9jZXNzb3Igc29sZWx5IGZvciBH
cmV5YnVzIGRvZXMgbm90IHNlZW0ganVzdGlmaWVkLiANCkFsc28sIHRoaXMgd291bGQgbWFrZSB0
aGUgYWJvdmUgbXVjaCBsZXNzIHBvcnRhYmxlLCBzaW5jZSBpdCBleHBlY3RzIGEgDQpoYXJkd2Fy
ZSBjb21wb25lbnQsIG5vdCBhbGwgQmVhZ2xlQm9hcmQub3JnIGJvYXJkcyBoYXZlLg0KDQogwqAg
wqBgYGANCiDCoCDCoCDCoCDCoCstLS0tK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICstLS0t
LS0tLS0tLS0tLS0rICstLS0tLS0tLS0tKw0KIMKgIMKgIMKgIMKgfCBBUCB8IDwtLS0gYnVzIC0t
LS0+wqAgwqB8IFNWQyAvIEJyaWRnZcKgIHwgPC0tLSBJMkMgLS0tLT7CoCDCoHwgDQpNb2R1bGXC
oCDCoHwNCiDCoCDCoCDCoCDCoCstLS0tK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICstLS0t
LS0tLS0tLS0tLS0rICstLS0tLS0tLS0tKw0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8ICstLS0tLS0tLS0tKw0KIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGAtLS0tLS0t
LS0tLSBJMkMgLS0tLT4gwqB8IE1vZHVsZcKgIMKgfA0KIMKgKy0tLS0tLS0tLS0rDQogwqAgwqBg
YGANCg0KMi4gU1ZDIHBlciBub2RlDQoNCiDCoCDCoEVhY2ggbm9kZSBpbXBsZW1lbnRzIGl0cyBv
d24gU1ZDLiBTaW5jZSBhbiBJwrJDIHNsYXZlIGNhbm5vdCBpbml0aWF0ZSANCmNvbW11bmljYXRp
b24sIHRoZSBBUCBtdXN0IGFscmVhZHkga25vdyB0aGUgYWRkcmVzcyBvZiBlYWNoIFNWQy9tb2R1
bGUuIA0KVGhpcyBhbHNvIHNlZW1zIGluZWZmaWNpZW50IHdoZW4gY2hhaW5pbmcgbXVsdGlwbGUg
bm9kZXMuDQoNCiDCoCDCoGBgYA0KIMKgIMKgIMKgIMKgKy0tLS0rwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgKy0tLS0tLS0tLS0tLS0tLS0rDQogwqAgwqAgwqAgwqB8IEFQIHwgPC0tLSBJMkMgLS0t
PsKgIHwgU1ZDIC8gTW9kdWxlwqAgwqB8DQogwqAgwqAgwqAgwqArLS0tLSvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCArLS0tLS0tLS0tLS0tLS0tLSsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgwqArLS0tLS0tLS0tLS0tLS0tLSsNCiDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGAtLS0tIEky
QyAtLS0tPsKgIMKgfCBTVkMgLyBNb2R1bGXCoCDCoHwNCiDCoCstLS0tLS0tLS0tLS0tLS0tKw0K
IMKgIMKgYGBgDQoNCjMuIFNWQy9CcmlkZ2UgZnVuY3Rpb25hbGl0eSBpbnNpZGUgdGhlIEFQDQoN
CiDCoCDCoEZvciB0aGlzIHVzZSBjYXNlLCB0aGlzIHNlZW1zIHRvIGJlIHRoZSBtb3N0IHByYWN0
aWNhbCBvcHRpb24uDQoNCiDCoCDCoFRvIGNsYXJpZnksIEkgYW0gbm90IHByb3Bvc2luZyBhbnkg
bmV3IGRhdGEgcGF0aHMgaW4gdGhlIEdyZXlidXMgDQpwaXBlbGluZS4gVGhlIGlkZWEgaXMgdG8g
aGF2ZSBhIHJldXNhYmxlIGFuIFNWQy9icmlkZ2UgaW1wbGVtZW50YXRpb24gDQpzaW1pbGFyIHRv
IHdoYXQgZXhpc3RzIGluIGdyZXlidXMtemVwaHlyIFsyXVszXSwgYnV0IGhvc3RlZCB3aXRoaW4g
dGhlIEFQLg0KDQogwqAgwqBgYGANCiDCoCDCoCDCoCDCoCstLS0tLS0tLS0tLS0tK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICstLS0tLS0tLS0tLSsNCiDCoCDCoCDCoCDCoHwgQVAgLyBTVkPCoCDC
oCB8IDwtLS0gSTJDIC0tLT7CoCB8IE1vZHVsZcKgIMKgIHwNCiDCoCDCoCDCoCDCoCstLS0tLS0t
LS0tLS0tK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICstLS0tLS0tLS0tLSsNCiDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwNCiDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzC
oCDCoCDCoCDCoCDCoCDCoCDCoCstLS0tLS0tLS0tKw0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYC0tIEkyQyAtLS0+wqAgfCBNb2R1
bGUgwqB8DQogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqArLS0tLS0tLS0tLSsNCiDCoCDCoGBgYA0K
DQpCZWZvcmUgcHJvY2VlZGluZyBmdXJ0aGVyLCBJIHdvdWxkIGFwcHJlY2lhdGUgZmVlZGJhY2sg
b24gdGhpcyANCmFwcHJvYWNo4oCUcGFydGljdWxhcmx5IHdoZXRoZXIgdGhlcmUgYXJlIGNvbmNl
cm5zIHdpdGggb3B0aW9uIDMsIG9yIGlmIA0KdGhlcmUgYXJlIGFsdGVybmF0aXZlIGRlc2lnbnMg
SSBzaG91bGQgY29uc2lkZXIuDQoNCkJlc3QgcmVnYXJkcywNCkF5dXNoIFNpbmdoDQoNClswXTog
aHR0cHM6Ly93d3cuc3BhcmtmdW4uY29tL3F3aWljDQpbMV06IA0KaHR0cHM6Ly93d3cuZGlnaWtl
eS5pbi9lbi9tYWtlci9wcm9qZWN0cy9taWNyb21vZC1xd2lpYy1wcm8ta2l0LXByb2plY3QtZ3Vp
ZGUvYTNkN2ZhMWEwNjNmNDJlY2IyYzJiM2MzMzcyNDliZGQNClsyXTogDQpodHRwczovL2dpdGh1
Yi5jb20vYmVhZ2xlYm9hcmQvZ3JleWJ1cy16ZXBoeXIvYmxvYi9tYWluL3N1YnN5cy9ncmV5YnVz
L3N2Yy5jI0w4MQ0KWzNdOiANCmh0dHBzOi8vZ2l0aHViLmNvbS9iZWFnbGVib2FyZC9ncmV5YnVz
LXplcGh5ci9ibG9iL21haW4vc3Vic3lzL2dyZXlidXMvYXBicmlkZ2UuYyNMNDIgDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJl
IHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
