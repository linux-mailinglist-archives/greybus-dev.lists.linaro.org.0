Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB2BIg6OA2pN7AEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 22:31:10 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671D529347
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 22:31:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2931B401F8
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 20:31:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	by lists.linaro.org (Postfix) with ESMTPS id A12053F78E
	for <greybus-dev@lists.linaro.org>; Tue, 12 May 2026 20:07:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=BkL63bU6;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.160.175 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=reject) header.from=ieee.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-512f09ecc67so42065481cf.3
        for <greybus-dev@lists.linaro.org>; Tue, 12 May 2026 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1778616457; x=1779221257; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ixm4A9b1aqS3/lbS+x6VLWagRbgpxDZK7p6coKIV70=;
        b=BkL63bU6fF6VkgZm8i7DWY39UPzbBtlaj7dMYAKAkbLhF4Ov+zcqU7OfGNVnspCDgs
         9rCYlI3XTYDVeEj7O3HHNRPQz1rL9yKZqOiN9ivXtJyI5Jb+A58fyhOPhl58JJW8khSH
         ECmsmidGfKq9s7J/tBnz00uZLk7HeNYWEdc/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778616457; x=1779221257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ixm4A9b1aqS3/lbS+x6VLWagRbgpxDZK7p6coKIV70=;
        b=VrhvCMAxxAGanUtPrR8BVAzsaKDsUg8bAJgN8CSSuX9jDPnaazji/1tc5Gxkrao8lN
         IaMT+UtZgAy9gZ1TaTUE/rAmehe8wic4TPMRvtZeQwYOoSDYhGiK48U6HHVi4e4oDhCC
         vDXasjtUQPuGUZr4uiy9Krwfkx3pg6mG965YizFBo0HxjYm62ungRDocFqJkJr4vtP6h
         c1Z6RVHvfs09ZOyQy99RotntY/sMdbjZEqfBcI+M4a1Jo3VtkXRpooNdnK6bk4bzm0Sc
         4V2klu0VvEVSOhHPfefiCObVjQ/WRL5HCC4v+BFEpRvlyxBPEkJaoMq4Ah6Vib+gc+oq
         Knlg==
X-Forwarded-Encrypted: i=1; AFNElJ/cUpTgHI2Z9Z6rt28rdGq5coi4up45YrpnBW/TQPiK+CJEbi+jNwnQ38XnK8EQE/Dbjo2s9fDqToOAIQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YzL20yOMFatTKNe2O0Am+2gT8GHgQfijPVHPlApeyy7THJ6gDVx
	+DRZEKAEtpaeMg/Nx4FON+KSpsB3MDTU5usmojIjMpuiMBylw47dU0gNs0F9VO+Afw==
X-Gm-Gg: Acq92OHt4tTvEhuSxjSEPTLgn3C5bmgpOtj3XZYF+0qHpMftdY2P7DZR07OKDDWD3PV
	NIrpzIowfaoSxFAERP5i4aw7L1jkawADPIpy1/JUB5kxtux7BI6cyAbEEaky4REhKm/yfHe0XVP
	89VKpsya2EhUFGqt2nhnja7TgM2WRCB3s/MuClYsgGy8gOJPntmOyEjrOfJTgoe1sz4eeGbc3Qj
	Bf/E47Cs8kudJjnlzMVDOndk6Ts3SWFsRGMqOHFQGGd/kXZhSaHt0mQFv1HYgTCbWi3JX1akiyE
	kSeQESt+cPu/DkQ838k9/3xCilvwh7HdZESrz3Tn58AgiGxkdqXYsiuvHwaXgiBfd3GPaLudDXA
	REWJIFnxMrtwEnliNrdXRukg59DDgnskP+S2gRt3WyvVgXK7N5ESstk737LCMIbguCpG10Hk+5S
	e8Jc9OXmHflmEypSCrquiaEl+cUnhjLxYb/g9fnSgDo/uBHwsb/k3tNZKfSg==
X-Received: by 2002:a05:622a:114:b0:50d:8e2c:6a68 with SMTP id d75a77b69052e-5162f62ff6amr1586561cf.51.1778616456762;
        Tue, 12 May 2026 13:07:36 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-5148e82579fsm125729151cf.24.2026.05.12.13.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 13:07:36 -0700 (PDT)
Message-ID: <77358a41-b4cf-4c11-b751-86f024fd4b72@ieee.org>
Date: Tue, 12 May 2026 15:07:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
 <agGdJFofiZYKqqhr@stanley.mountain>
 <c17dd24c-2bf1-4ef8-a8d3-79014a75242f@al2klimov.de>
 <2026051243-factual-lyricism-6c54@gregkh>
 <381ed71b-1db1-45d3-a9be-bf2f8018a611@al2klimov.de>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <381ed71b-1db1-45d3-a9be-bf2f8018a611@al2klimov.de>
X-Spamd-Bar: ----
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TI5EM2MYX47GFTLNZXESEKQFHP3LWMVQ
X-Message-ID-Hash: TI5EM2MYX47GFTLNZXESEKQFHP3LWMVQ
X-Mailman-Approved-At: Tue, 12 May 2026 20:30:54 +0000
CC: Dan Carpenter <error27@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pankaj Bharadiya <pankaj.bharadiya@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: audio: correct sscanf() return value check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TI5EM2MYX47GFTLNZXESEKQFHP3LWMVQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
X-Rspamd-Queue-Id: 1671D529347
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ieee.org : SPF not aligned (relaxed),reject,sampled_out];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ieee.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@ieee.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[ieee.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.844];
	DBL_BLOCKED_OPENRESOLVER(0.00)[al2klimov.de:email,riscstar.com:email]
X-Rspamd-Action: no action

T24gNS8xMi8yNiAyOjE1IFBNLCBBbGV4YW5kZXIgQS4gS2xpbW92IHdyb3RlOg0KPiBtYW5hZ2Vy
X3N5c2ZzX2FkZF9zdG9yZSgpIHBhc3NlcyA2IHBvaW50ZXJzIHRvIHNzY2FuZigpLA0KPiBidXQg
cmVxdWlyZWQgbGF0dGVyIHRvIHJldHVybiA3IHdoaWNoIGFsd2F5cyBmYWlsZWQgdGhlIG9wZXJh
dGlvbi4NCj4gSSBjb3JyZWN0ZWQgaXQgdG8gNi4NCj4gDQo+IEZpeGVzOiA0OWI5MTM3YTYwMDIg
KCJzdGFnaW5nOiBncmV5YnVzOiBhdWRpbzogcmVtb3ZlIHJlZHVuZGFudCBzbG90IA0KPiBmaWVs
ZCIpDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBBLiBLbGltb3YgPGdyYW5kbWFzdGVyQGFs
MmtsaW1vdi5kZT4NCg0KTG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IEFsZXggRWxkZXIgPGVs
ZGVyQHJpc2NzdGFyLmNvbT4NCg0KPiAtLS0NCj4gIMKgdjI6IGFkZGVkICJGaXhlczoiIHRvIGNv
bW1pdCBtZXNzYWdlDQo+ICDCoHYzOiBhZGRlZCBhbGwgdGhlc2UgdjIvdjMgbGluZXMgaGVyZSBh
cyByZXF1ZXN0ZWQgYnkgR3JlZyBLSA0KPiAgwqB2Mzogd2hpbGUgb24gaXQsIHJlcGxhY2VkIHRp
dGxlICJHcmV5YnVzIGF1ZGlvIHByb3RvY29scyBkcml2ZXJzOiIgLi4uDQo+ICDCoHYzOiAuLi4g
d2l0aCAic3RhZ2luZzogZ3JleWJ1czogYXVkaW86Ig0KPiANCj4gIMKgZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvYXVkaW9fbWFuYWdlcl9zeXNmcy5jIHwgMiArLQ0KPiAgwqAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX3N5c2ZzLmMgYi9kcml2ZXJzLyANCj4g
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXJfc3lzZnMuYw0KPiBpbmRleCBmY2Q1MThmOTU0
Li5mZjMyM2NhODE1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19tYW5hZ2VyX3N5c2ZzLmMNCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
bWFuYWdlcl9zeXNmcy5jDQo+IEBAIC0yMyw3ICsyMyw3IEBAIHN0YXRpYyBzc2l6ZV90IG1hbmFn
ZXJfc3lzZnNfYWRkX3N0b3JlKHN0cnVjdCBrb2JqZWN0IA0KPiAqa29iaiwNCj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBkZXNjLm5hbWUsICZkZXNjLnZpZCwgJmRlc2MucGlkLCAmZGVzYy5p
bnRmX2lkLA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZkZXNjLmlwX2RldmljZXMsICZk
ZXNjLm9wX2RldmljZXMpOw0KPiANCj4gLcKgwqDCoCBpZiAobnVtICE9IDcpDQo+ICvCoMKgwqAg
aWYgKG51bSAhPSA2KQ0KPiAgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsNCj4gDQo+
ICDCoMKgwqDCoCBudW0gPSBnYl9hdWRpb19tYW5hZ2VyX2FkZCgmZGVzYyk7DQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNl
bmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
