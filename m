Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0726C39E4
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:09:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9E1813ED72
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:09:08 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	by lists.linaro.org (Postfix) with ESMTPS id 45D353EBA6
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 16:25:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=fFzSM5Jk;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.44 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id ek18so61962587edb.6
        for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679415932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHMT9Xr2+W+0aZObi2mrOj/GJsmUfVzdBpDa2xFjqFw=;
        b=fFzSM5JkCjlmXiD09LOwSN9/IftvYM/eJdR+B6K1aOMJB2NIqughDWOlTBdy53jryF
         6Zqjemy9MJO0nRzqV0XcXaZg5lLbncmqTAYaA8SBl0fwdqPo7a5oibu9TkvOwnTz5xYS
         2uKemtqGytoIiQqBSD5Ku4rCma+jT0XbPU44/tCYvM9WypBtgnJCfvq4k6/GRDHKLRLk
         scK/YfIkqowJ3bVi0wG890w4I2UCIAi+VZKVDtZrziSqv5bQJkB78eoCMnYqcg8yJf3l
         bUDRQYG0KFAeBFpFj64r5v9UCNr9+Vco/Ra786LiwPpqD4B33raDG85crulo3voxj9tB
         +tWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679415932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHMT9Xr2+W+0aZObi2mrOj/GJsmUfVzdBpDa2xFjqFw=;
        b=0pQdCkqePTaljQtdO22pWnAKnAkp0QVAFeVfpiej5ZPUKhV25kP/zraBoK1Vjokqdi
         Bq5ucTAjxyo263vQn6lkIxVkUlbGjrnHcPqvnRxutSfrXcXRGLOSKBVX0JVKyf7xntjp
         JC8YfrLV5vAvo9ecsr3SaXLuTmUUtdymJ91VoWy3cgSlyFfGOW0N0Hh82+EUAWNdgm1H
         zn+fWuJ/S3Z5M/N6tKitruDrCAw/0yoXOmFHpmnunw1HT3MRwza57VTbylMlVhsVFVnA
         2qUaVNRS7GRF31PDfCc0YrdbQEp9Ha+MYh64AYQRhqQP7KVQT49AdraDobKiMMuIKYcc
         3qAA==
X-Gm-Message-State: AO0yUKXCzz0qH+MFLy4nvsPHgPbON0OrdHsifiORVm3Tv44DzYwvazPp
	cPXcEfQaA/DPwIq/9xKOD2U=
X-Google-Smtp-Source: AK7set9s5dirn8v7ylCH0oBwYIq+eEI2x+SguvYsPnh+vHgtJ9ZDva1ItQo9ylvDURpwutqCgjRDSg==
X-Received: by 2002:aa7:c7d4:0:b0:4fa:7679:d44c with SMTP id o20-20020aa7c7d4000000b004fa7679d44cmr3402124eds.11.1679415932175;
        Tue, 21 Mar 2023 09:25:32 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id a13-20020a509e8d000000b00501d73cfc86sm1483658edf.9.2023.03.21.09.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 09:25:31 -0700 (PDT)
Message-ID: <7c883bac-382c-b429-ab21-4675dce02474@gmail.com>
Date: Tue, 21 Mar 2023 18:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <1274302b52ae905dab6f75377d625598facbbdf1.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <20230321154728.3r7ut3rl2pccmo2e@pengutronix.de>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <20230321154728.3r7ut3rl2pccmo2e@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 45D353EBA6
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	URIBL_BLOCKED(0.00)[mail-ed1-f44.google.com:helo,mail-ed1-f44.google.com:rdns];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.44:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,lists.linaro.org,vger.kernel.org,inria.fr];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VLKSWG3QHE5WCGYUZ4C3DZIVSKJUGXD7
X-Message-ID-Hash: VLKSWG3QHE5WCGYUZ4C3DZIVSKJUGXD7
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:07 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/3] staging: greybus: use inline function for macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VLKSWG3QHE5WCGYUZ4C3DZIVSKJUGXD7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZotmh4oCPL9mj4oCPL9mi2aDZotmjINmh2ac62aTZpywgVXdlIEtsZWluZS1Lw7ZuaWcg
d3JvdGU6DQo+IEhlbGxvLA0KPg0KPiBqdXN0IHNvbWUgbml0cGlja3M6DQo+DQo+IE9uIFR1ZSwg
TWFyIDIxLCAyMDIzIGF0IDAxOjA0OjMzQU0gKzAyMDAsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQo+
PiBDb252ZXJ0IGB0b19nYnBoeV9kZXZgIGFuZCBgdG9fZ2JwaHlfZHJpdmVyYCBtYWNyb3MgaW50
byBhDQo+PiBzdGF0aWMgaW5saW5lIGZ1bmN0aW9uLg0KPj4NCj4+IGl0IGlzIG5vdCBncmVhdCB0
byBoYXZlIG1hY3JvIHRoYXQgdXNlIGBjb250YWluZXJfb2ZgIG1hY3JvLA0KPiBzL2l0L0l0Lzsg
cy9tYWNyby9tYWNyb3MvOyBzL3VzZS91c2UgdGhlLzsNCk9rYXksIEkgd2lsbCBmaXggaXQuDQo+
DQo+PiBiZWNhdXNlIGZyb20gbG9va2luZyBhdCB0aGUgZGVmaW5pdGlvbiBvbmUgY2Fubm90IHRl
bGwgd2hhdCB0eXBlDQo+PiBpdCBhcHBsaWVzIHRvLg0KPj4gWy4uLl0NCj4+IC0jZGVmaW5lIHRv
X2dicGh5X2RldihkKSBjb250YWluZXJfb2YoZCwgc3RydWN0IGdicGh5X2RldmljZSwgZGV2KQ0K
Pj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IGdicGh5X2RldmljZSAqdG9fZ2JwaHlfZGV2KGNvbnN0
IHN0cnVjdCBkZXZpY2UgKmQpDQo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmMgYWx3
YXlzIHBhc3NlcyBhIHZhcmlhYmxlIG5hbWVkDQo+ICJkZXYiIHRvIHRoaXMgbWFjcm8uIFNvIEkn
ZCBjYWxsIHRoZSBwYXJhbWV0ZXIgImRldiIsIHRvbywgaW5zdGVhZCBvZg0KPiAiZCIuIFRoaXMg
aXMgYWxzbyBhIG1vcmUgdHlwaWNhbCBuYW1lIGZvciB2YXJpYWJsZXMgb2YgdGhhdCB0eXBlLg0K
Pg0KPj4gK3sNCj4+ICsJcmV0dXJuIGNvbnRhaW5lcl9vZihkLCBzdHJ1Y3QgZ2JwaHlfZGV2aWNl
LCBkZXYpOw0KPj4gK30NCj4+IFsuLi5dDQo+PiAgIH07DQo+PiAtI2RlZmluZSB0b19nYnBoeV9k
cml2ZXIoZCkgY29udGFpbmVyX29mKGQsIHN0cnVjdCBnYnBoeV9kcml2ZXIsIGRyaXZlcikNCj4+
ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBnYnBoeV9kcml2ZXIgKnRvX2dicGh5X2RyaXZlcihzdHJ1
Y3QgZGV2aWNlX2RyaXZlciAqZCkNCj4+ICt7DQo+PiArCXJldHVybiBjb250YWluZXJfb2YoZCwg
c3RydWN0IGdicGh5X2RyaXZlciwgZHJpdmVyKTsNCj4+ICt9DQo+IFdpdGggYSBzaW1pbGFyIHJl
YXNvbmluZyAoYW5kIGFsc28gdG8gbm90IGhhdmUgImQicyB0aGF0IGFyZSBlaXRoZXINCj4gZGV2
aWNlIG9yIGRldmljZV9kcml2ZXIpIEknZCByZWNvbW1lbmQgImRydiIgaGVyZS4NCg0KDQpwbGVh
c2UgY2hlY2sgdGhpcyB3aXRoIEp1bGlhLCBiZWNhdXNlIHNoZSBzYWlkIHRoZXkgc2hvdWxkIGRp
ZmZlcmVudC4NCg0KDQpUaGFua3MsDQoNCk1lbm5hDQoNCj4NCj4gQmVzdCByZWdhcmRzDQo+IFV3
ZQ0KPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8g
dW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5h
cm8ub3JnCg==
