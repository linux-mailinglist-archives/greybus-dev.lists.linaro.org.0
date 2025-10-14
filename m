Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F184EBDBE6E
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Oct 2025 02:17:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 049DB45F8F
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Oct 2025 00:17:28 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	by lists.linaro.org (Postfix) with ESMTPS id 14F8643D1F
	for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 23:53:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=jGSc7KBG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of vivek.balachandhar@gmail.com designates 209.85.222.182 as permitted sender) smtp.mailfrom=vivek.balachandhar@gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-88e51cf965dso1614285a.2
        for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 16:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760485988; x=1761090788; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ob1OnhaB8yNlYIjqAs5ylAnnzR5hzBaZ/c2ZonR81NM=;
        b=jGSc7KBGZ3hugdkuqck/b/eRpS2IHt6vmx2Aoo+T07y7CLLCytZ8Bh2naBIbAY1aFv
         jfZ5QPOo4mj7oPts/IvvI8hJ8XjC14FX3ox+Fj8+5hFkvTqbsFrvNq+seENFd3yCPtLG
         ZcGtqIz/+JoDxOPCMLQxrkbXZr3kEFaxZKiN8Vml0TBOIpum1FjRHb3xamy6dz2FgmB/
         TJ18Cqdygpj++L5UDBOjsGGRqzwjuh0q3yPq15a8dGJZT2sxnnmDytLdD6Br6BthGOXo
         NJBXEha3EipN/uEJu9zFP49crbBBbENXCtGADfaFseHMKyPsdWdjPm9s+YQIbepx+uGq
         zzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760485988; x=1761090788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob1OnhaB8yNlYIjqAs5ylAnnzR5hzBaZ/c2ZonR81NM=;
        b=Eg5Fy2MelfdrWjsDSmlNC4juJZwnZ5CG+YbU629uAUZFAkwLyqXn2TvX79rBJ5LPHI
         GhZugzQX8wEApVA7Fw42zUrzTEgIi1tqWWKYNzpWPVbWGrfOSw7NzuU7lzZoCW3+LKHI
         /tRwBKlle6pBxQqta/jg2X1+ItBR+EGZVn0MRV85jD45DGUcQtyFXNs9W/FR3z9PSih5
         FwYCy781BKi5B80jt/xTFKNpumb5mbAjrMzI8vDiLuywEX8Bppwj56Lof6+C4WX5ROvd
         1QLvahJ61bhsVRhkJRt/39OYIrWVrwIP4a+oHv/V82xzqyvAEYneM4RF8rWzpiOmzjN3
         YenA==
X-Forwarded-Encrypted: i=1; AJvYcCUUORUVH9dsu4NItbqE/5TMa1bdKXxZsnIYMijYcXq5Vp1vdVAfZKYSf+cDHHrPa4N/ktozTTBDuLHOjg==@lists.linaro.org
X-Gm-Message-State: AOJu0YwMbAGqn1TpmCF4Cr24mrXWuPXwWlblbjHOtNWgDXJvqFhbFPkN
	1LYpab7Ye3FSy3jaxkcDwC/WmFUDWwCwcYHDGV5KOlMS37Q5XDedFrt+
X-Gm-Gg: ASbGnct3FjFEx58osSdqmg/vBWw4GEnxCMlaT//nYPYSQjF/Nrd45sTn8Z8qrYsRfSf
	q+8RDLZnJu4/f25sqmzAgjb6GpPBrB1xp8K1qzjJK7aphHMNvO44IbbHHoQYJkfggFOF7JvsKEc
	BdQKAxqUOJNsqqNenJ8a+4/v8PNiGgQL54Gd8lZsyQCUq7RtQD1LjfFOQih28gK1e8R3M2j4Z5T
	C8nj3k0ESRN2AQbW+6wX1ZPYeJbrK+DyCYFDBFKmwl6NoZG9TC1XJTrdML32TKd/6dxhTOq3wr8
	DDzf9UER/sOnA2ScZmUbl709H/gAGhdajPQmQASmeL5rG/1TN8pyH9UTmgTZyBW4yhcP26pjjDa
	+ObmSHkg/TIinM5luolaHQHkwJNYW5Py7jRU01CPcryaUfKyKGrXtJIXJMNDchC+Vr0u1
X-Google-Smtp-Source: AGHT+IHqzXmUGwko+aYtEh2ILwYIMC3c/wyMbPVlj1R55EMnuDNxOjiiifOG9dp6+prvXd8kQnjCfQ==
X-Received: by 2002:a05:620a:44c1:b0:85d:3c32:c404 with SMTP id af79cd13be357-88353464330mr3229717785a.85.1760485988310;
        Tue, 14 Oct 2025 16:53:08 -0700 (PDT)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a2273e9dsm1286214585a.47.2025.10.14.16.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 16:53:07 -0700 (PDT)
Message-ID: <451b7aaf-86d0-4a0d-9578-b76c3a7886d5@gmail.com>
Date: Tue, 14 Oct 2025 19:53:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
 <aO5VvrKTswmfO-n9@stanley.mountain>
 <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
 <aO5a9izAISpCDJrc@stanley.mountain>
 <8f550b4e-2b7e-4266-be92-bb724265949f@gmail.com>
 <aO6EyUVO9EOYfzV4@stanley.mountain>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <aO6EyUVO9EOYfzV4@stanley.mountain>
X-Rspamd-Queue-Id: 14F8643D1F
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.182:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-qk1-f182.google.com:rdns,mail-qk1-f182.google.com:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: vivek.balachandhar@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ICOXSADVMBH3W42IVULOUJRFZM6TB2FY
X-Message-ID-Hash: ICOXSADVMBH3W42IVULOUJRFZM6TB2FY
X-Mailman-Approved-At: Wed, 15 Oct 2025 00:17:25 +0000
CC: johan@kernel.org, elder@kernel.org, schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: documentation: replace strncpy() with strscpy_pad()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ICOXSADVMBH3W42IVULOUJRFZM6TB2FY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGkgRGFuLA0KDQpUaGFua3MgZm9yIGNsYXJpZnlpbmcuIFRoYXQgbWFrZXMgc2Vuc2Ug4oCUIHNp
bmNlIHRoZSBzdHJ1Y3Qgc3RhcnRzDQp6ZXJvZWQgYW5kIHRoZSBsYXN0IGJ5dGUgcmVtYWlucyB1
bnRvdWNoZWQsIHRoZSBjdXJyZW50IGNvZGUgaXMNCmFscmVhZHkgc2FmZS4gSeKAmWxsIGRyb3Ag
dGhpcyBwYXRjaC4NCg0KQXBwcmVjaWF0ZSB0aGUgcXVpY2sgZ3VpZGFuY2UuDQoNCkJlc3QNClZp
dmVrDQoNCk9uIDIwMjUtMTAtMTQgMToxMyBwLm0uLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0KPiBP
biBUdWUsIE9jdCAxNCwgMjAyNSBhdCAxMjoxMDo1MFBNIC0wNDAwLCBWaXZlayBCYWxhY2hhbmRo
YXJUTiB3cm90ZToNCj4+IEhpIERhbiwNCj4+DQo+PiBUaGFua3MgYWdhaW7igJRjb25maXJtZWQg
dGhlIHN0cnVjdHMgYXJlIHplcm8taW5pdGlhbGl6ZWQgYmVmb3JlIHRoZSBjb3B5Lg0KPj4NCj4+
IFdvdWxkIGEgbWluaW1hbCBmaXggdGhhdCBndWFyYW50ZWVzIE5VTC10ZXJtaW5hdGlvbiBiZSBh
Y2NlcHRhYmxlLCBlLmcuOg0KPj4NCj4+IHN0cm5jcHkoKGNoYXIgKikmaW50Zl9sb2FkLmZpcm13
YXJlX3RhZywgZmlybXdhcmVfdGFnLA0KPj4gIMKgIMKgIMKgIMKgIEdCX0ZJUk1XQVJFX1VfVEFH
X01BWF9TSVpFIC0gMSk7DQo+PiAoKGNoYXIgKikmaW50Zl9sb2FkLmZpcm13YXJlX3RhZylbR0Jf
RklSTVdBUkVfVV9UQUdfTUFYX1NJWkUgLSAxXSA9ICdcMCc7DQo+Pg0KPj4gSSBjYW4gcmVzcGlu
IGFzIHYyIHdpdGggdGhlIHNhbWUgY2hhbmdlIGFwcGxpZWQgdG8gdGhlIG90aGVyIHR3bw0KPj4g
ZmlybXdhcmVfdGFnDQo+PiBmaWVsZHMuDQo+IFNvcnJ5LCBJIHNob3VsZCBoYXZlIGV4cGxhaW5l
ZCB0aGlzIGF0IHRoZSBzdGFydC4uLiAgVGhlIHN0cnVjdCBpcw0KPiBpbml0aWFsaXplZCB0byB6
ZXJvLiAgVGhlIHN0cm5jcHkoKSBjb3BpZXMgYXQgbW9zdA0KPiAiR0JfRklSTVdBUkVfVV9UQUdf
TUFYX1NJWkUgLSAxIiBjaGFyYWN0ZXJzLCBtZWFuaW5nIHdlIG5ldmVyIGNvcHkNCj4gYW55dGhp
bmcgdG8gdGhlIGxhc3QgY2hhcmFjdGVyIHdoaWNoIHN0YXlzIGFzIHplcm8uDQo+DQo+IHJlZ2Fy
ZHMsDQo+IGRhbiBjYXJwZW50ZXINCj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1k
ZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
